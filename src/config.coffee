gm = require 'gm'

IMAGE_TYPE = "png"

module.exports =

  # Nashville
  mythical: (source) ->
    gm(source)
      .fill('#222b6d')
      .colorize('33%')
      .fill('#F7CBAE')
      .colorize('33%')
      .contrast('+')
      .contrast('+')
      .modulate(100, 150, 100)
      .gamma(0.75)
      .stream(IMAGE_TYPE)

  # Lomo
  wurst: (source) ->
    gm(source)
      .level('25%')
      .fill('#222b6d')
      .colorize('30')
      .modulate(90, 80, 100)
      .compose('Over')
      .stream(IMAGE_TYPE)

  # Gothom
  fathom: (source) ->
    gm(source)
      .modulate(120, 10, 100)
      .fill('#222b6d')
      .colorize('20')
      .gamma(0.5)
      .stream(IMAGE_TYPE)

  # Custom
  granadela: (source) ->
    gm(source)
      .modulate(150, 80, 80)
      .fill('#330000')
      .colorize('40%')
      .contrast('+')
      .contrast('+')
      .stream(IMAGE_TYPE)