class duck.Brain
  constructor: (@duck)->
    $(@duck).on 'quack', @quack

  quack: (event, options) ->
    console.log options.message
    $(@duck).trigger 'response'
      next_question: 'Hello.'
      answer_type: 'short'

