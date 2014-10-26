Filters = require './filters'

class Vintager

  constructor: ->
    @_filters = new Filters()
    @filters = @_filters.names()

module.exports = new Vintager()