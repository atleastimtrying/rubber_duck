class window.duck.App
  constructor: ->
    @beak = new duck.Beak @
    @brain = new duck.Brain @
$ ->
  window.duck = new App