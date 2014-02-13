class duck.PatternMatcher
  constructor: (@str) ->

  toString: -> @str
  toClauses: ->
    for clause in @str.split(@clauseBoundryRegex())
      new duck.PatternMatcher(clause)
  toLikelyNouns: ->
    found_nouns = []
    for match in @toClauses()
      noun = match.findNoun()
      found_nouns.push(noun) unless @disqualifyNoun(noun)
    console.log found_nouns
    found_nouns

  findNoun: ->
    match = @str.match(@nounMatcher())
    return match[1] if match
    false

  clauseBoundryRegex: ->
    /(?:\s*\.\s*| and | or | but | although | except (?:that))/

  nounMatcher: ->
    /(?:this )?(?:(?:(.+)|it)(?: is| is| ain't| aint|'s)|i have a (.+)|my (.+))/i

  disqualifyNoun: (noun)->
    return true unless noun
    return true if noun is ''
    noun is 'it' or noun is 'this' or noun is 'that' or noun is 'my app' or noun is 'this app'

