class duck.Bill
  constructor: (@duck)->
    @navigation = new window.duck.Navigation @duck
    @success = new window.duck.Success @duck
    @renderer = new window.duck.Renderer @duck
    @ears = new window.duck.Ears @duck
    @duck.trigger 'print_question', "Can you describe your problem in a paragraph? use small sentences please I'm only a duck"
    @duck.trigger 'print_long'