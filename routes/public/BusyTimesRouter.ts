import Router from "express";
import BusyTimesController from "../../api/controllers/BusyTimes.controller";
import checkRoleMiddleware from "../../api/middlewares/checkRoleMiddleware";

const router = Router();

router.post(
  "/create-busy-times",
  checkRoleMiddleware("ADMIN"),
  BusyTimesController.createBusyTimesData
);

// router.post('get-all-busy-times', BusyTimesController.getFreeTimesData)

router.post('/create-busy-record', BusyTimesController.createRecord)

router.post('/get-busy-times', BusyTimesController.getBusyTimesByDate)

export default router