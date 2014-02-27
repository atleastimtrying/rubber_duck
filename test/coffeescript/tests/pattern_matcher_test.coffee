describe "The Brain's Pattern Matcher", ->
  it "can be instantiated", ->
    expect(-> new duck.PatternMatcher("some text")).not.toThrow()

  describe "when given multiple sentances", ->
    beforeEach ->
      text = "I'm not a pheasant plucker, I'm a pheasant plucker's son. I'm only plucking pheasants til the pheasant plucker comes."
      @matcher = new duck.PatternMatcher(text)

    it "can produce an array of sentence patterns", ->
      sentances = @matcher.toClauses()
      expect(sentances[0].toClauses).toBeDefined()

  describe "semantic analysis", ->
    beforeEach ->
      text = "My app is not working. I have a kickboxing champion and it is not picking up its thingammy"
      @matcher = new duck.PatternMatcher(text)

    it "should split the text into clauses", ->
      expect(@matcher.toClauses().length).toEqual(3)


    it "should find likely nouns from the clauses", ->
      expect(@matcher.toLikelyNouns().length).toEqual(1)

