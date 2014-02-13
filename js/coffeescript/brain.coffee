class duck.Brain
  constructor: (@app)->
    @machine = new duck.FitnessStateMachine()
    @quack({}, {})
    $(@app).on 'quack', @quack

  quack: (event, options) =>
    state = @machine.getNext options.message
    $(@app).trigger 'response', state
