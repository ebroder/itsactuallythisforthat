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

Backbone = require 'backbone'
express = require 'express'
less = require 'less'
fs = require 'fs'
mkdirp = require 'mkdirp'
path = require 'path'

app = express.createServer()

app.configure ->
        app.set 'views', path.join __dirname, 'views'
        app.set 'view engine', 'jade'

        app.use express.favicon()
        app.use express.logger()
        app.use express.bodyParser()
        app.use express.cookieParser()
        app.use express.methodOverride()
        app.use express.static path.join __dirname, 'generated'

app.configure 'development', ->
        app.use express.errorHandler
                dumpExceptions: true
                showStack: true

app.get '/', (req, res) ->
        res.render 'index.jade'

port = process.env.PORT || 3000
app.listen port, ->
        console.log "Listening on #{port}"
