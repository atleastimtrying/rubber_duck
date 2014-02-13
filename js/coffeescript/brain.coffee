class duck.Brain
  constructor: (@duck)->
    @state = new duck.FitnessStateMachine()
    $(@duck).on 'quack', @quack

  quack: (event, options) ->
    $(@duck).trigger 'response',
      next_question: 'Why?'
      answer_type: 'short'

