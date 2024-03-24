import { DataTypes } from "sequelize";
import database from "../database";

export const BusyTimes = database.define("busyTimes", {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  email: { type: DataTypes.STRING },
  firstname: { type: DataTypes.STRING },
  lastname: { type: DataTypes.STRING },
  patronymic: { type: DataTypes.STRING },
  phone: { type: DataTypes.STRING },
  time: { type: DataTypes.STRING },
  date: { type: DataTypes.STRING },
});
