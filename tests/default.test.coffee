{expect} = require 'chai'
mocha = require 'mocha'
vintager = require '../src/vintager'
Filters = require '../src/filters'
stream = require 'stream'
fs = require 'fs'

describe "Vintager", ->

  describe.skip "(filter:String, source:ReadableStream)", ->

    it "should return stream.Readable", ->
      expect(true).to.not.be.ok

  describe.skip "(filter:String, url:String)", ->

    it "should return stream.Readable", ->
      expect(true).to.not.be.ok

    it "should return with undefined if url isn't a string", ->
      expect(true).to.not.be.ok

    it "should return with undefined if url isn't a url", ->
      expect(true).to.not.be.ok

    it "should return with undefined if url isn't available", ->
      expect(true).to.not.be.ok

  describe '#filters', ->

    it "should return array", ->
      expect(vintager.filters).to.be.an "array"
      expect(vintager).to.not.be.empty

    it "should have each array item a string", ->
      expect(filter).to.be.an "string" for filter in vintager.filters

describe "Filter", ->

  describe '#stream()', ->
    filter =

    beforeEach ->
      filter = new Filters.Filter('#stream()')

    it "should throw error if unimplemented", ->
      expect(filter.stream).to.throw Error

describe "Filters", ->
  filters =
  validFilter = "mythical"

  beforeEach ->
    filters = new Filters()

  describe "()", ->

    it "should instantiate", ->
      expect(filters).to.exist
      expect(filters).to.be.an "object"

  describe '#names', ->

    it "should return an array of strings", ->
      expect(filters.names()).to.be.an "array"
      expect(filter).to.be.an "string" for filter in filters.names()

  describe '#hasFilter', ->

    it "should return true when asked about first filter", ->
      expect(filters.hasFilter(validFilter)).to.be.true

    it "should return false when filter doesn't exist", ->
      expect(filters.hasFilter("#{validFilter}-joke!")).to.be.false

  # Different nodejs streams are sometimes hard to end
  #   so testing processes cannot exit
  describe '#stream(source:ReadableStream, filter:String)', ->
    imageStream =

    beforeEach ->
      imageStream = fs.createReadStream './tests/test.jpg'
      expect(imageStream).to.be.an.instanceof stream.Readable

    afterEach ->
      imageStream.close()

    it "should return a stream with valid input; readablestream", ->
      filterStream = filters.stream imageStream, validFilter
      expect(filterStream).to.be.an.instanceof stream.Transform
      filterStream.end()

    it "should return error if stream isn't an image", ->
      filterStream = filters.stream imageStream, validFilter
      filterStream.end()

  describe.skip '#stream(source:String, filter:String)', ->

    it "should return a stream with valid input; url", ->
      expect(true).to.be.false

    it "should return error if stream from the url isn't an image", ->
      expect(true).to.be.false

return