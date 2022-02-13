const Login = require('../models/login_model')
const User = require('../models/user_model')
const messages = require('../constants/message_constants')
const { customResponse } = require('../models/response_model')
const utility = require('../utility/email_service')
const http = require('../constants/http_status_constants')

const login = async (req, res) => {
    try {
        const requestBody = new Login(req.body);
        console.log(requestBody)
        const user = await User.findOne({ email: requestBody.email, password: requestBody.password })
        if (user) {
            return res.status(http.FETCH).json(customResponse(true, null, user))
        } else {
            return res.status(http.BAD_REQUEST).json(customResponse(false, messages.USER.login.emailOrPasswordWrong, null))
        }
    } catch (error) {
        return res.status(http.INTERNAL_SERVER).json(
            customResponse(false, messages.SERVER_ERRORS.internal_server_error, null)
        )
    }
}

const register = async (req, res) => {
    try {
        const user = new User(req.body)
        await user.save()
        return res.status(http.CREATED).json(customResponse(true, null, null))
    } catch (error) {
        return res.status(http.INTERNAL_SERVER).json(customResponse(false, messages.SERVER_ERRORS.internal_server_error, null))
    }
}

const forgetPassword = async (req, res) => {
    try {
        const email = req.body.email
        const user = await User.findOne({ email: email })
        if (user) {
            const generatedPassword = utility.generateRandomPassword()
            const isUserUpdated = await User.findOneAndUpdate({ email: email }, {
                $set: {
                    password: generatedPassword
                }
            })
            if (isUserUpdated) {
                utility.sendMail(email, generatedPassword)
                return res.status(http.UPDATED).json(customResponse(true, messages.USER.forgetPassword.passwordUpdated, null))
            }
        } else {
            return res.status(http.NOT_FOUND).json(customResponse(false, messages.USER.forgetPassword.userNotFound, null))
        }
    } catch (error) {
        return res.status(http.INTERNAL_SERVER).json(customResponse(false, messages.SERVER_ERRORS.internal_server_error, null))
    }
}

module.exports = {
    login,
    register,
    forgetPassword
}