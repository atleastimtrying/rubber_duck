class window.duck.Speaking
  constructor: (@duck)->
    @duck.on 'response', @speak_response
  speak_response: (event, options)->
    meSpeak.speak options.next_question, 
      amplitude: 100
      wordgap: 3
      pitch: 50
      speed: 175
      variant: 'f4'
      
    