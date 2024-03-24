import { DataTypes } from "sequelize";
import database from "../database";

export const Record = database.define('record', {
  id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
  record: {type: DataTypes.JSON, defaultValue: ""},
})