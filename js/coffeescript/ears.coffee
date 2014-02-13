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
    console.log 'quack'
    @duck.trigger 'answer', 
      message: $('#duck .current').val(),
      render: console.log
    @duck.trigger 'strip_current'