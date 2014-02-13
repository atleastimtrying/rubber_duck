describe "The duck", ->
  it "can be instantiated", ->
    expect ->
      new Duck(->)
    .not.toThrow()


