import { Record } from "../../database/models/Record";
import ModelException from "../errors/ModelException";

export default class CalendarService {
  public static async updateCalendar(calendar) {
    try {
      const myCalendar = await Record.findOne({ where: { id: 1 } });
      if (!myCalendar) {
        await Record.create({ record: "" });
      }
      const updatedCalendar = await Record.update(
        { record: JSON.stringify(calendar) },
        { where: { id: 1 } }
      );
      console.log(updatedCalendar);
      console.log(calendar);

      return updatedCalendar;
    } catch (error) {
      console.log(error);
      throw ModelException.ModelNotFound("Calendar not found and not updated");
    }
  }

  public static async getCalendar() {
    try {
      const myCalendar = await Record.findOne({ where: { id: 1 } });

      return myCalendar;
    } catch (error) {
      throw ModelException.ModelNotFound("Calendar not found for users");
    }
  }
}
