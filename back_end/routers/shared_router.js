const sharedRouter = require('express').Router()
const sharedController = require('../controllers/shared_controller')

sharedRouter.post('/addWasteType', sharedController.addWasteType)

module.exports = sharedRouter