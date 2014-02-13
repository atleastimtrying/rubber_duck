class window.duck.App
  constructor: ->
    @navigation = new duck.Navigation @
    @success = new duck.Success @
$ ->
  window.duck = new App