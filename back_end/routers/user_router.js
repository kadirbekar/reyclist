const userRouter = require('express').Router()
const userController = require('../controllers/user_controller')

userRouter.post('/updateUserPoint', userController.updateUserPoint)

module.exports = userRouter