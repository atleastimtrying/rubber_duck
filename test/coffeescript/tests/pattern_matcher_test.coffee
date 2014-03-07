describe "The Brain's Pattern Matcher", ->
  it "can be instantiated", ->
    expect(-> new duck.PatternMatcher("some text")).not.toThrow()

  describe "when given multiple sentances", ->
    beforeEach ->
      text = "I'm not a pheasant plucker, I'm a pheasant plucker's son. I'm only plucking pheasants til the pheasant plucker comes."
      @matcher = new duck.PatternMatcher(text)

    it "can produce an array of sentance patterns", ->
      sentances = @matcher.toClauses()
      expect(sentances[0].toClauses).toBeDefined()

  describe "semantic analysis", ->
    beforeEach ->
      text = "My app is not working. I have a kickboxing champion and it is not picking up its thingammy"
      @matcher = new duck.PatternMatcher(text)

    it "should split the text into clauses", ->
      Array.prototype.isArray = true
      expect(@matcher.toClauses().isArray).toBe(true)

  describe "when finding nouns", ->
    @texts = [
      "I have a problem with my ducky. It just doesn't work.",
      "My ducky doesn't work.",
      "This ducky wont work",
      "This ducky won't play ball.",
      "Please help me with my ducky",
      "I have a ducky that keeps lying to me",
      "Our ducky is buggering up",
      "If I try to do anything funky, the ducky will balls it up"
    ]

    for text in @texts
      it "should find and invert appropriate nouns in '#{text}'", ((text)->
        ->
          matcher = new duck.PatternMatcher(text)
          expect(matcher.toLikelyNouns()).toContain "your ducky"
      )(text) # force a pass-by-value rather than by reference
