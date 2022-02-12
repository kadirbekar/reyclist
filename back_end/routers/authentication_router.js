const authenticationRouter = require('express').Router()
const authenticationController = require('../controllers/authentication_controller')

authenticationRouter.post('/login', authenticationController.login)
authenticationRouter.post('/register', authenticationController.register)

module.exports = authenticationRouter