const mongoose = require('mongoose')
const Schema = mongoose.Schema

const WasteTypeSchema = new Schema({
    "name": {
        type: String,
        required: true,
    },
}, { collection: "wasteType", versionKey: false })

const WasteType = mongoose.model('WasteType', WasteTypeSchema)
module.exports = WasteType