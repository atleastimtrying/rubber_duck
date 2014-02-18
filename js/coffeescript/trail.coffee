class duck.Trail
  constructor: (@duck)->
    @duck.on 'quack', @logQuack
    @duck.on 'success', @logSuccess
  logQuack: (event, quack)->
    console.log(quack,'quack occurred, added to ga');
  logSuccess: ->
    console.log('success occurred, added to ga');