backbone = require('backbone')
express = require('express')

app = express.createServer()

app.configure ->
        app.use express.logger()
        app.use express.bodyParser()
        app.use express.cookieParser()
        app.use express.methodOverride()

app.configure 'development', ->
        app.use express.errorHandler
                dumpExceptions: true
                showStack: true

port = process.env.PORT || 3000
app.listen port, ->
        console.log "Listening on #{port}"
