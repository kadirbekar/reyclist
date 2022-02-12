const mongoose = require('mongoose')
const Schema = mongoose.Schema

const LoginSchema = new Schema({
    "email": {
        type: String,
        required: true,
        trim: true,
    },
    "password": {
        type: String,
        required: true,
        trim: true,
    }
}, { collection: "login", versionKey: false })

const Login = mongoose.model('Login', LoginSchema)
module.exports = Login