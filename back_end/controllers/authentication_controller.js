const Login = require('../models/login_model')
const User = require('../models/user_model')
const messages = require('../constants/message_constants')
const { customResponse } = require('../models/response_model')

const login = async (req, res) => {
    try {
        const requestBody = req.body;
        const user = await User.findOne({ email: requestBody.email })
        if (user && user.password == req.body.password) {
            return res.status(200).json(customResponse(true, null, user.id))
        } else {
            return res.status(400).json(customResponse(false, messages.USER.login.emailOrPasswordWrong, null))
        }
    } catch (error) {
        return res.status(500).json(
            customResponse(false, messages.SERVER_ERRORS.internal_server_error, null)
        )
    }
}

const register = async (req, res) => {
    try {
        const user = new User(req.body)
        await user.save()
        return res.status(201).json(customResponse(true, null, null))
    } catch (error) {
        return res.status(500).json(customResponse(false, messages.SERVER_ERRORS.internal_server_error, null))
    }
}

module.exports = {
    login,
    register
}