const authenticationRouter = require('express').Router()
const authenticationController = require('../controllers/authentication_controller')

authenticationRouter.post('/login', authenticationController.login)
authenticationRouter.post('/register', authenticationController.register)
authenticationRouter.post('/forgetPassword', authenticationController.forgetPassword)

module.exports = authenticationRouter