class window.duck.App
  constructor: ->
    @bill = new duck.Bill $ @
    @brain = new duck.Brain $ @
$ ->
  window.exposed_duck = new duck.App
