class duck.Ears
  constructor: (@duck)->
    @bindUI()
  bindUI: ->
    $('#duck').on
      keyup: @check_key
    , '.current'
  check_key: (event)=>
    @quack() if event.keyCode is 13
  
  quack: =>
    @duck.trigger 'quack', 
      message: $('#duck .current').val()