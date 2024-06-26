import dotenv from "dotenv";
dotenv.config();
import Express, { json } from "express";
import database from "./database/database";
import router from "./routes";
import errorMiddleware from "./api/middlewares/error-middleware";
import cookieParser from "cookie-parser";
import cors from "cors";
import fileupload from "express-fileupload";
import path from "path";

const app = Express();

const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(json());
app.use(Express.static(path.resolve(__dirname, "api", "static")));
app.use(cookieParser());
app.use(fileupload({}));
app.use(errorMiddleware);
app.use("/api", router);

const start = async () => {
  try {
    await database.authenticate();
    // await database.sync({alter: true, force: true});
    await database.sync();
    app.listen(PORT, () => {
      console.log(`Server listening on port ${PORT}`);
    });
  } catch (error) {
    console.log(error);
  }
};

start();
