class duck.Bill
  constructor: (@duck)->
    @navigation = new window.duck.Navigation @duck
    @success = new window.duck.Success @duck
    @renderer = new window.duck.Renderer @duck
    @ears = new window.duck.Ears @duck    
    
    @duck.trigger 'response', 
      next_question: "Can you describe the problem in a paragraph? use small sentences please I'm only a duck."
      answer_type: 'long'
    
    @duck.on 'quack', (event, options)=>
      @duck.trigger 'response', 
        next_question: 'Why?'
        answer_type: 'short'
      