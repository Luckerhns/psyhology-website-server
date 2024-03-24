import { createTransport } from "nodemailer";
import { htmlTemplate } from "../../templates/htmlTemplate";
import { successRecordTemplate } from "../../templates/successUserTemplate";

class MailService {
  transporter: any;
  constructor() {
    this.transporter = createTransport({
      service: "gmail",
      host: process.env.SMTP_HOST,
      port: +process.env.SMTP_PORT,
      secure: false,
      auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASSWORD,
      },
    });
  }
  public async sendActivationMail(to, link) {
    await this.transporter.sendMail({
      from: process.env.SMTP_USER,
      to,
      subject: `Activation account on ${process.env.API_URL}`,
      text: "",
      html: htmlTemplate(link),
    });
  }

  public async sendUserRecordMail(to, time, date) {
    await this.transporter.sendMail({
      from: process.env.SMTP_USER,
      to,
      subject: `Вы успешно записаны!`,
      text: "",
      html: successRecordTemplate(date, time),
    });
  }
}

export default new MailService();
