class window.duck.App
  constructor: ->
    @bill = new duck.Bill $ @
    @brain = new duck.Brain $ @
    @transcriber = new duck.Transcriber
$ ->
  window.exposed_duck = new duck.App
