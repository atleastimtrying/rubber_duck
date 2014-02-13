class duck.Bill
  constructor: (@duck)->
    @navigation = new duck.Navigation @duck
    @success = new duck.Success @duck