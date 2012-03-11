http = require 'http'

exports.get = (options, cb, error) ->
        response = ""
        return http.get options, (res) ->
                res.on "error", error
                res.on "data", (chunk) -> return response += chunk
                res.on "end", -> return cb res.statusCode, response
