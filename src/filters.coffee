# Collection of kind of common image filters used by
# a number of popular services.

_filters = require "./config"

# Basic filter container.
class Filter

  constructor: (@name) ->
    @debug = require("debug")("#{@name}_filter")

  stream: ->
    @debug("Unimplemented stream() method")
    throw new Error('Unimplemented stream() method')

# Collection of filters that have been extended.
class FilterCollection

  constructor: ->
    @filters = []
    for name, stream of _filters
      filter = new Filter "#{name.toLowerCase()}"
      filter.stream = stream
      @filters.push filter

  names: ->
    (filter.name for filter in @filters)

  hasFilter: (filter) ->
    filter in (f.name for f in @filters)

  stream: (source, filter) ->
    (item for item in @filters when item.name is filter)[0].stream(source)

FilterCollection.Filter = Filter
module.exports = FilterCollection