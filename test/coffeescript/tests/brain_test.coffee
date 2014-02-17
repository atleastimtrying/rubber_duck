describe "The Brain", ->
  it "can be instantiated", ->
    expect ->
      new duck.Brain(->)
    .not.toThrow()

  describe "when processing text", ->
    beforeEach ->
      @duck = ->
      @brain = new duck.Brain(@duck)