const mongoose = require('mongoose')
const Schema = mongoose.Schema

const TransactionSchema = new Schema({
    "createdDate": {
        type: Date,
        default: Date.now,
    },
    "point": {
        type: Number,
        required: true,
    },
    "recyclingCenterId": {
        type: String,
        required: true,
    },
    "userId": {
        type: String,
        required: true
    },
    "wasteType": {
        type: String,
        required: true
    }
}, { collection: "transaction", versionKey: false })

const Transaction = mongoose.model('Transaction', TransactionSchema)
module.exports = Transaction