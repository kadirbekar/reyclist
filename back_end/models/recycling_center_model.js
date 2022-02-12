const mongoose = require('mongoose')
const Schema = mongoose.Schema

const RecyclingCenterSchema = new Schema({
    "name": {
        type: String,
        required: true,
        trim: true,
        unique: true
    },
    "address": {
        type: String,
        trim: true
    },
    "location": {
        type: String,
    },
    "imageUrl": {
        type: String,
    },
    "description": {
        type: String,
    }
}, { collection: "recyclingCenter", versionKey: false })

const RecyclingCenter = mongoose.model('RecyclingCenter', RecyclingCenterSchema)
module.exports = RecyclingCenter