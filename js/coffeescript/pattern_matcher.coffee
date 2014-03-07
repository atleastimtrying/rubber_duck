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
    found_nouns

  findNoun: ->
    match = @str.match(@ownedItemRegex())
    return @invertOwner(match[1]) if match && match[1]
    false

  invertOwner: (noun)->
    noun.replace(@ownerRegex(), 'your ')

  ownerRegex: ->
    /(?: |^)(my|the|this|that|our|a|an) /i

  ownedItemRegex: ->
    /(?: |^)((?:my|the|this|that|our|a|an) .+)/i

  clauseBoundryRegex: ->
    # /(?:\. |- |, | and | or | but | although | except (?:that))/i
    /(?:\. |- |, | and | or | but | which | that | although | except | with | is | isn'?t | ain'?t | will | won'?t | can | can'?t | does | doesn'?t | are | aren'?t)/i

  notNouns: ->
    /^(it|this|that|(?:my|this|the) app(?:lication)?)$/i

  disqualifyNoun: (noun)->
    return true unless noun
    return true if noun is ''
    noun.match @notNouns()

