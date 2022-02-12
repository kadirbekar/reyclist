const { customResponse } = require('../models/response_model')
const messages = require('../constants/message_constants')
const User = require('../models/user_model')
const Transaction = require('../models/transaction_model')
const http = require('../constants/http_status_constants')

const updateUserPoint = async (req, res) => {
    try {

        const id = req.body.id
        const point = req.body.point

        const user = await User.findById({ _id: id })
        user.point = user.point + point
        await user.save()

        const transaction = new Transaction()


        if (user) {
            return res.status(http.UPDATED).json(customResponse(true, null, null))
        } else {
            return res.status(http.BAD_REQUEST).json(customResponse(false, messages.ERROR.general_error_message, null))
        }

    } catch (error) {
        return res.status(http.INTERNAL_SERVER).json(customResponse(false, messages.SERVER_ERRORS.internal_server_error, null))
    }
}

module.exports = {
    updateUserPoint
}