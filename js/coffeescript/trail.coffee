class duck.Trail
  constructor: (@duck)->
    @duck.on 'quack', @logQuack
    @duck.on 'success', @logSuccess
  logQuack: ->
    console.log('quack occurred, added to ga');
  logSuccess: ->
    console.log('success occurred, added to ga');