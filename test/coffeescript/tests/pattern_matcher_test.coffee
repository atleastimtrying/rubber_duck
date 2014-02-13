describe "The Brain's Pattern Matcher", ->
  it "can be instantiated", ->
    expect(-> new duck.PatternMatcher("some text")).not.toThrow()

  describe "when given multiple sentances", ->
    beforeEach ->
      text = "I'm not a pheasant plucker, I'm a pheasant plucker's son. I'm only plucking pheasants til the pheasant plucker comes."
      @matcher = new duck.PatternMatcher(text)

    it "can produce an array of sentance patterns", ->
      sentances = @matcher.toSentances()
      expect(sentances[0].toSentances).toBeDefined()