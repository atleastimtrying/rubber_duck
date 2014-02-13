class duck.Brain
  constructor: (@duck)->
    @state = new duck.FitnessStateMachine()
    @quack({}, {})
    $(@duck).on 'quack', @quack

  quack: (event, options) ->
    state = @state.getNext options.message
    $(@duck).trigger 'response', state

