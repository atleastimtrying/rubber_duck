describe "The Brain", ->
  it "can be instantiated", ->
    expect ->
      new duck.Brain()
    .not.toThrow()

  # describe "when processing text", ->
  #   beforeEach ->
  #     @processor = new Processor()

  #   it "can give an answer", ->
  #     answer = @processor.giveAnswer
  #     expect(answer.toString()).toEqual(answer)
  #     expect(answer.length).toBeGreaterThan(1)