import { BusyTimes } from "../../database/models/BusyTImes";
import { Record } from "../../database/models/Record";
import ErrorException from "../errors/ErrorException";
import ModelException from "../errors/ModelException";
import BusyTimesService from "../services/BusyTimes.service";
import MailService from "../services/dependencies/Mail.service";

export default class BusyTimesController {
  public static async createBusyTimesData(req, res, next) {
    try {
      const { timesArr, date } = req.body;

      const busyTimes = await BusyTimesService.createBusyTimes(timesArr, date);

      return res.json(busyTimes);
    } catch (error) {
      next(error);
    }
  }

  public static async getBusyTimesByDate(req, res, next) {
    try {
      const busyTimes = await BusyTimesService.getBusyTimes();

      return res.json(busyTimes);
    } catch (error) {
      next(error);
    }
  }

  public static async createRecord(req, res, next) {
    try {
      const { firstname, lastname, patronymic, phone, date, email, time } =
        req.body;

      const newRecord = await Record.findOne();

      const calendar = JSON.parse(newRecord.dataValues.record);

      const recordDate = calendar.find((arg, key) => {
        if (arg.date === date) {
          return date;
        }
      });

      const notSelectedTimes = recordDate.notSelectedTimes;

      const busyTimes = recordDate.busyTimes;

      const updatedBusyTimes = busyTimes.push({
        time,
        firstname,
        lastname,
        patronymic,
        phone,
        email,
      });

      const updatedNotSelectedTimes = notSelectedTimes.splice(
        notSelectedTimes.indexOf(time),
        1
      );


      const toJsonCalendar = await Record.update(
        { record: JSON.stringify(calendar)},
        { where: {} }
      );

      const newBusyTimeRecord = await BusyTimes.create({
        email: email,
        firstname: firstname,
        lastname: lastname,
        patronymic: patronymic,
        phone: phone,
        time: time,
        date: date,
      });

      await MailService.sendUserRecordMail(email, time, date);

      return res.json(newBusyTimeRecord);
    } catch (error) {
      next(error);
    }
  }
}
