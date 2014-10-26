# Collection of kind of common image filters used by
# a number of popular services.

gm = require 'gm'

###*
 * Basic filter container.
###
class Filter

  ###*
   * @param  {String} @name Filter name
   * @return {Filter}
  ###
  constructor: (@name) ->
    @debug = require("debug")("#{@name}_filter")

###*
 * Collection of filters that have been extended.
###
class FilterCollection

  ###*
   * @return {FilterCollection}
  ###
  constructor: ->
    @filters = []
    for filter in [0...10] by 1
      @filters.push new Filter "Filter#{filter}"

  ###*
   * Gets names of all filters.
   * @return {Array} Filter names
  ###
  names: ->
    (filter.name for filter in @filters)

  ###*
   * Checks to see if a filter exists by a given
   *   name.
   * @param  {String}  filter  Given filter name
   * @return {Boolean}         If the filter exists
  ###
  hasFilter: (filter) ->
    filter in (f.name for f in @filters)

module.exports = FilterCollection