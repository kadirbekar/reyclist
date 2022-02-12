const sharedRouter = require('express').Router()
const sharedController = require('../controllers/shared_controller')

sharedRouter.post('/addWasteType', sharedController.addWasteType)
sharedRouter.post('/addRecyclingCenter', sharedController.addRecyclingCenter)

module.exports = sharedRouter