import Router from 'express'
import CalendarController from '../../api/controllers/Calendar.controller'

const router = Router()

router.use('/update-calendar', CalendarController.updateCalendar)
router.use('/get-calendar', CalendarController.getCalendar)

export default router