import { BusyTimes } from "../../database/models/BusyTImes";

export default class BusyTimesService {
  public static async createBusyTimes(timesArr, date) {
    const busyTimes = await BusyTimes.create({
      busyTimes: timesArr,
      date: date,
    });

    return busyTimes;
  }

  public static async getBusyTimes() {
    const busyTimesInDate = BusyTimes.findAndCountAll({});

    return busyTimesInDate;
  }
}
