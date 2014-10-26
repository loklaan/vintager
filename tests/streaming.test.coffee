{expect} = require 'chai'
mocha = require 'mocha'
vintager = require '../src/vintager'
Filters = require '../src/filters'

describe "Vintager", ->

  describe.skip "(filter:String)", ->

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

describe "Filters", ->
  filters =
  existingFilter = "Filter1"

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

    it "should return true when filter exists", ->
      expect(filters.hasFilter(existingFilter)).to.be.true

    it "should return false when filter doesn't exist", ->
      expect(filters.hasFilter("#{}{existingFilter}-joke!")).to.be.false
