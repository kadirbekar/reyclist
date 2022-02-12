const mongoose = require('mongoose')
const Schema = mongoose.Schema

const RecyclingSchema = new Schema({
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
    "recyclingCenterId": {
        type: String,
        required: true,
    }
}, { collection: "recycling", versionKey: false })

const Recycling = mongoose.model('Recycling', RecyclingSchema)
module.exports = Recycling