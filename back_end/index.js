const express = require('express')
const app = express()

app.use(express.json());

require('./database/mongoose')

const authenticationRouter = require('./routers/authentication_router')
const userRouter = require('./routers/user_router')
const sharedRouter = require('./routers/shared_router')

app.use('/api/authentication', authenticationRouter)
app.use('/api/user', userRouter)
app.use('/api/shared', sharedRouter)

app.use('/apiTest', (req, res) => {
    return res.status(201).json({
        ok: true,
    })
})

app.listen(process.env.PORT || 3000, (err, suc) => {
    if (err) throw err

    console.log(`port running`)
})
