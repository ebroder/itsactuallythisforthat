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

fetch = require '../lib/fetch'
Backbone = require 'backbone'

class Startup extends Backbone.Model
        initialize: ->
                if not this.has("this") or not this.has("that")
                        console.log('wtf, dude?')

        fetchPair: (cb, error) ->
                options =
                        host: "itsthisforthat.com"
                        path: "/api.php?json"
                return fetch.get options,
                        ((code, resp) =>
                                if code != 200
                                        return error new Error "Bad return code: #{code}"
                                try
                                        this.set JSON.parse resp
                                        return cb()
                                catch err
                                        return error err),
                        error
exports.Startup = Startup
