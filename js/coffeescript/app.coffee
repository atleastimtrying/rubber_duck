class window.duck.App
  constructor: ->
    @bill = new duck.Bill $ @
    @brain = new duck.Brain $ @
$ ->
  new duck.App