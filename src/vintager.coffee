Filters = require './filters'

class Vintager

  constructor: ->
    @_filters = new Filters()
    @filters = @_filters.names()

  filter: (filter, source) ->
    @_filters.stream source, filter

module.exports = new Vintager()