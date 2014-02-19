class window.duck.App
  constructor: ->
    meSpeak.loadConfig "voices/mespeak_config.json"
    meSpeak.loadVoice "voices/en.json", @start
  start: =>
    @bill = new duck.Bill $ @
    @brain = new duck.Brain $ @
$ ->
  window.exposed_duck = new duck.App
