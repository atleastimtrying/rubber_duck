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

    $('#duck').on
      click: @reset
    , '.current_reset'

    $('#duck').on
      click: @submit_noun
    , '.submit_noun'

  check_key: (event)=>
    @quack() if event.keyCode is 13

  submit_noun: (event)=>
    event.preventDefault() if event
    @duck.trigger 'quack',
      message: $(event.currentTarget).data('noun')

  quack: (event)=>
    event.preventDefault() if event
    @duck.trigger 'quack',
      message: $('#duck .current').val()

  reset: (event)=>
    event.preventDefault() if event
    @duck.trigger 'reset'