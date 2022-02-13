const RecyclingCenter = require('../models/recycling_center_model')
const WasteType = require('../models/waste_type')
const messages = require('../constants/message_constants')
const { customResponse } = require('../models/response_model')
const http = require('../constants/http_status_constants')
const shared = require('../constants/shared_data')

const addWasteType = async (req, res) => {
    try {
        const wasteType = new WasteType(req.body)
        await wasteType.save()
        return res.status(http.CREATED).json(customResponse(true, null, null))
    } catch (error) {
        return res.status(http.INTERNAL_SERVER).json(customResponse(false, messages.SERVER_ERRORS.internal_server_error, null))
    }
}

const addRecyclingCenter = async (req, res) => {
    try {
        const recyclingCenter = new RecyclingCenter(req.body)
        await recyclingCenter.save()
        return res.status(http.CREATED).json(customResponse(true, null, null))
    } catch (error) {
        return res.status(http.INTERNAL_SERVER)
    }
}

const fetchCouponsAndArticles = async (req, res) => {
    return res.status(http.FETCH).json(customResponse(true, null, shared.data))
}


module.exports = {
    addWasteType,
    addRecyclingCenter,
    fetchCouponsAndArticles
}