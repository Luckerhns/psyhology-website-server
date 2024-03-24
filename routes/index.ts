import Router from 'express'
import UserRouter from './public/UserRouter'
import BusyTimesRouter from './public/BusyTimesRouter'
import RecordRouter from './public/RecordRouter'
import AdminRouter from './private/index'

const router = Router()

router.use('/user', UserRouter)
router.use('/record', RecordRouter)
router.use('/busy-times', BusyTimesRouter)
router.use('/admin', AdminRouter)

export default router