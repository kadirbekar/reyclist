const mongoose = require('mongoose')
const Schema = mongoose.Schema

const UserSchema = new Schema({
    "email": {
        type: String,
        required: true,
        trim: true,
        unique: true
    },
    "password": {
        type: String,
        required: true,
        trim: true,
    },
    "name": {
        type: String,
        required: true,
        trim: true,
    },
    "surname": {
        type: String,
        required: true,
        trim: true,
    },
    "phoneNumber": {
        type: String,
        required: true,
        trim: true,
        unique: true
    },
    "countryCode": {
        required: true,
        trim: true,
        type: String,
    }
}, { collection: "user", versionKey: false })

const User = mongoose.model('User', UserSchema)
module.exports = User