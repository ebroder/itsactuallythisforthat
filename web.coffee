###
Copyright © 2012 Evan Broder

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301 USA.
###

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
