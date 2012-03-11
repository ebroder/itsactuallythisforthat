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
