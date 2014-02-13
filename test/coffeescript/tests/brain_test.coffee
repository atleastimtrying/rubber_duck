describe "The Brain", ->
  it "can be instantiated", ->
    expect ->
      new duck.Brain(->)
    .not.toThrow()

  describe "when processing text", ->
    beforeEach ->
      @duck = ->
      @brain = new duck.Brain(@duck)

    it "can give an answer", ->
      $(@duck).on 'response', (event, response)->
        expect(response['next_question']).toEqual("Why?")

      @brain.quack {},
        message: "Hi, ducky"