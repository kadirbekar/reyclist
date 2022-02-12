require('dotenv').config()
const mongoose = require('mongoose')
const databaseMessages = require('../constants/database_constants')

mongoose.connect(process.env.mongodbUrl, {
    useNewUrlParser: true,
    useUnifiedTopology: true
})
    .then(suc => console.log(databaseMessages.SUCCESS.general_success_message))
    .catch(err => console.log(`${err} - ${databaseMessages.ERROR.general_error_message}`));