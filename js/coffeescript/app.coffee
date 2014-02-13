class window.duck.App
  constructor: ->
    @bill = new duck.Bill @
    @brain = new duck.Brain @
$ ->
  window.duck = new duck.App