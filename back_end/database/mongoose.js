const mongoose = require('mongoose')
const databaseMessages = require('../constants/database_constants')
const uri = "mongodb+srv://flutter:flutter@cluster0.dewhs.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

mongoose.connect(uri, { 
    useNewUrlParser: true,
    useUnifiedTopology: true})
    .then(suc => console.log(databaseMessages.SUCCESS.general_success_message))
    .catch(err => console.log(`${err} - ${databaseMessages.ERROR.general_error_message}`));