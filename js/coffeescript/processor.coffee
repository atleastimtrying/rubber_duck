class duck.Brain
  constructor: (@duck)->
    $(@duck).on 'quack', @quack

  quack: (event, options) ->
    console.log options.message
    options.render "I'm sorry, Dave, I just don't know."

