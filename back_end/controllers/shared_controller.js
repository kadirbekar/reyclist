const WasteType = require('../models/waste_type')
const { customResponse } = require('../models/response_model')
const messages = require('../constants/message_constants')

const addWasteType = async (req, res) => {
    try {
        const wasteType = new WasteType(req.body)
        await wasteType.save()
        return res.status(201).json(customResponse(true, null, null))
    } catch (error) {
        return res.status(201).json(customResponse(false, messages.SERVER_ERRORS.internal_server_error, null))
    }
}

module.exports = {
    addWasteType
}