describe "The duck", ->
  it "can instantiate a duck", ->
    expect ->
      new Duck(->)
    .not.toThrow()


