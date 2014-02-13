class window.duck.Success
  constructor: (@duck)->
    @bindUI()
  bindUI: =>
    $('.done').click @done
  done: (event)=>
    event.preventDefault()
    $('.congratulations').slideUp();