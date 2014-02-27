class window.duck.Listening
  constructor: (@duck)->
    @recognition = @setup_recognition()
    @bind_recognition()
    @recording = false
    @final_transcript = ""
    @duck.on 'start_recording', @begin
    @duck.on 'end_recording', @stop

  setup_recognition: ->
    r = new webkitSpeechRecognition()
    r.continuous = true
    r.interimResults = true
    r.lang = 'en-GB'
    r

  begin: =>
    if @recording
      @recognition.stop()
      @recognition.start() 
    else
      @recognition.start()

  stop: =>
    @recognition.stop() if @recording

  bind_recognition: =>
    $(@recognition).on
      start: @start
      error: @error
      result: @result
      end: @end

  start: =>
    console.log 'started'
    @recording = true

  error: (event)=>
    console.log event
    @stop()

  result: (event)=>
    if typeof(event.originalEvent.results) is 'undefined'
      @stop()
    else
      for result in event.originalEvent.results
        if result.isFinal
          @final_transcript += result[0].transcript
    $('.current').val @final_transcript

  end: =>
    console.log 'ended'
    @recording = false
    @final_transcript = ""