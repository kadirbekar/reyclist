require('dotenv').config()
const messages = require('../constants/message_constants')
const nodemailer = require('nodemailer');

function generateRandomPassword() {
    var password = "";
    for (let index = 0; index < 3; index++) {
        if (password.length <= 3) {
            password += ('a1bc2d3ef4g5hı7ij8kl0mn8oö9prstyuvyzwx').split('')[(Math.floor(Math.random() * 26))];
        }
    }
    password += new Date().getMilliseconds();
    return password.toUpperCase()
}

function sendMail(receiver, newPassword) {

    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.email,
            pass: process.env.password
        }
    });

    var mailOptions = {
        from: 'reyclistapp@gmail.com',
        to: receiver,
        subject: messages.EMAIL.newPasswordGenerated,
        text: newPassword
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
            return true
        }
    });
}

module.exports = {
    sendMail,
    generateRandomPassword
}