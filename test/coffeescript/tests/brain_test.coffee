describe "The Brain", ->
  it "can be instantiated", ->
    new duck.Brain(->)
    expect ->
      new duck.Brain(->)
    .not.toThrow()

  describe "when processing text", ->
    beforeEach ->
      @brain = new duck.Brain()

    it "can give an answer", ->
      @brain.quack {},
        message: "Hi, ducky",
        render: (answer)=>
          expect(answer.toString()).toEqual(answer)
          expect(answer.length).toBeGreaterThan(1)