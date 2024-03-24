import { Record } from "../../database/models/Record";
import CalendarService from "../services/Calendar.service";

export default class CalendarController {
  public static async updateCalendar(req, res, next) {
    try {
      const calendar = req.body;
      const updatedCalendar = await CalendarService.updateCalendar(calendar);
      return res.json(updatedCalendar);
    } catch (error) {
      next(error);
    }
  }

  public static async getCalendar(req, res, next) {
    try {
      const calendar = await CalendarService.getCalendar()

      return res.json(calendar)
    } catch (error) {
      next(error)
    }
  }
}
