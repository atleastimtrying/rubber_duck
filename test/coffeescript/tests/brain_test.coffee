describe "The Brain", ->
  it "can be instantiated", ->
    expect ->
      new duck.Brain()
    .not.toThrow()

  describe "when processing text", ->
    beforeEach ->
      @brain = new duck.Brain()

    it "can give an answer", ->
      answer = @brain.giveAnswer
      expect(answer.toString()).toEqual(answer)
      expect(answer.length).toBeGreaterThan(1)