import Router from 'express'
import CalendarRoute from './calendarRoute'

const router = Router()

router.use('/calendar', CalendarRoute)

export default router