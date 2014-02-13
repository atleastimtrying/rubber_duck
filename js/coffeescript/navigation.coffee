class window.duck.Navigation
  constructor: (@duck)->
    @bindUI()
  bindUI: =>
    $('nav a').click @go
  go: (event)=>
    event.preventDefault()
    link = $ event.currentTarget
    target = $ link.attr 'href'
    $('html, body').animate
      scrollTop: target.offset().top
    , 500