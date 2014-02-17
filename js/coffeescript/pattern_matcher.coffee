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
      console.log "Noun found:", noun
      found_nouns.push(noun) unless @disqualifyNoun(noun)
    found_nouns

  findNoun: ->
    match = @str.match(@nounMatcher())
    return @invertOwner(match[1]) if match && match[1]
    false

  invertOwner: (noun)->
    noun.replace(@ownerRegex(), 'your ')

  ownerRegex: ->
    /(?: |^)(my|the|this|that|our) /i

  clauseBoundryRegex: ->
    /(?:\. |- |, | and | or | but | although | except (?:that))/i

  nounMatcher: ->
    /(?:its|it is|it's) (.+)|(?:this )?(?:(?:(.+)|it)(?: is| is| ain't| aint| does|'s| are| aren't)|i have a (.+)|my (.+))/i

  notNouns: ->
    /^(it|this|that|(?:my|this|the) app(?:lication)?)$/i

  disqualifyNoun: (noun)->
    return true unless noun
    return true if noun is ''
    noun.match @notNouns()

