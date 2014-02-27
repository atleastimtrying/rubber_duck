class duck.Bill
  constructor: (@duck)->
    #@listening = new window.duck.Listening @duck
    @speaking = new window.duck.Speaking @duck
    @navigation = new window.duck.Navigation @duck
    @success = new window.duck.Success @duck
    @renderer = new window.duck.Renderer @duck
    @ears = new window.duck.Ears @duck
    #@trail = new window.duck.Trail @duck
      