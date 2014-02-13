class duck.Ears
  constructor: (@duck)->
    @bindUI()
  bindUI: ->
    $('#duck').on
      keyup: @check_key
    , '.current'

    $('#duck').on
      click: @quack
    , '.current_submit'

  check_key: (event)=>
    @quack() if event.keyCode is 13
  
  quack: (event)=>
    event.preventDefault() if event
    @duck.trigger 'quack', 
      message: $('#duck .current').val()