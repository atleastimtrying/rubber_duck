describe "The Brain's Fitness-Powered State Machine", ->
  it "can be instantiated", ->
    expect(-> new duck.FitnessStateMachine()).not.toThrow()