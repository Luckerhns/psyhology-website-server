import { compare } from "bcrypt";
import User from "../../database/models/User";
import UserDto from "../dto/user-dto";
import { hash } from "bcrypt";
import { v4 } from "uuid";
import TokenService from "./dependencies/Token.service";
import ErrorException from "../errors/ErrorException";

export default class UserService {
  public static async registration(params) {
    const { email, password, role } = params;

    // CHECK USER EXIST
    const candidate = await User.findOne({ where: { email } });
    if (candidate)
      throw ErrorException.CandidateExists("User with this email is exists");

    // CREATE HASH PASSWORD
    const hashPassword = await hash(password, 3);
    const activationLink = await v4();

    // CREATING USER
    const user = await User.create({
      ...params,
      password: hashPassword,
      activationLink: activationLink,
      role: role,
    });

    const userDto = new UserDto(user);

    // CREATE TOKENS
    const tokens = await TokenService.generateTokens({ ...userDto });

    // EMAIL ACTIVATION
    // await MailService.sendActivationMail(
    //     email,
    //     `${process.env.API_URL}/api/activate/${activationLink}`
    // );

    const data = await TokenService.saveToken(userDto.id, tokens.refreshToken);

    return { ...tokens, user: userDto };
  }

  public static async login(email, password) {
    // FIND USER
    try {
      if (
        email.toLowerCase() === "TatianaEremina2200".toLowerCase() &&
        password.toLowerCase() === "TatianaPassword".toLowerCase()
      ) {
        const user = await User.findOne({ where: { email: email } });
        if (!user) {
          const user = await User.create({ email: email, password: password });

          const userDto = new UserDto(user);
          const tokens = TokenService.generateTokens({ ...userDto });

          await TokenService.saveToken(userDto.id, tokens.refreshToken);
          return { ...tokens, user: userDto };
        } else {
          console.log('User is not authenticated!')
        }
      }
    } catch (error) {
      throw new ErrorException("Ошибка входа :", error.message);
    }
  }

  public static async logout(refreshToken) {
    const token = await TokenService.removeToken(refreshToken);
    return token;
  }
}
