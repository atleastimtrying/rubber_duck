describe "The duck", ->
  it "can be instantiated", ->
    expect ->
      new duck.App(->)
    .not.toThrow()


