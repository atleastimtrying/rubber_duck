class duck.Bill
  constructor: (@duck)->
    @navigation = new window.duck.Navigation @duck
    @success = new window.duck.Success @duck
    @renderer = new window.duck.Renderer @duck
    @ears = new window.duck.Ears @duck
      