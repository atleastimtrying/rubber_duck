class duck.Brain
  constructor: (@duck)->
    @duck.on 'quack', @quack
    @first_question()

  quack: (event, options) =>
    @duck.trigger 'response',
      next_question: 'What?'
      answer_type: 'short'
  
  first_question: =>
    @duck.trigger 'response', 
      next_question: "Can you describe the problem in a paragraph? use small sentences please I'm only a duck."
      answer_type: 'long'
