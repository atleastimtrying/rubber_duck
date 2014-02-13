class duck.Brain
  constructor: (@app)->
    @reset()
    $(@app).on 'quack', @quack
    $(@app).on 'reset', @reset

  quack: (event, options) =>
    state = @machine.getNext options.message
    $(@app).trigger 'response', state

  reset: (event, options) =>
    @machine = new duck.FitnessStateMachine()
    @quack({}, {})
