const sharedRouter = require('express').Router()
const sharedController = require('../controllers/shared_controller')

sharedRouter.post('/addWasteType', sharedController.addWasteType)
sharedRouter.post('/addRecyclingCenter', sharedController.addRecyclingCenter)
sharedRouter.get('/fetchCouponsAndArticles', sharedController.fetchCouponsAndArticles)

module.exports = sharedRouter