class duck.PatternMatcher
  constructor: (@str) ->

  toString: -> @str
  toTokens: ->
    @str
  toSentances: ->
    $.map @str.split('.'), -> new duck.PatternMatcher()


