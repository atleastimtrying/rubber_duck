class window.duck.Listening
  constructor: (@duck)->
    @recognition = @setup_recognition()
    @recording = false
    @bind_recognition()

    @final_transcript = ""
    @duck.on 'response', @begin
    $('#duck').on 
      'click': @stop
    , '.current_submit'

  setup_recognition: ->
    r = new webkitSpeechRecognition()
    r.continuous = true
    r.interimResults = true
    r.lang = 'en-GB'
    r

  begin: =>
    @recognition.stop() if @recording
    @recognition.start()
    @recording = true

  stop: =>
    @recognition.stop()

  bind_recognition: =>
    $(@recognition).on
      start: @start
      error: @error
      result: @result
      end: @end

  start: =>
    console.log 'started'

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
    @final_transcript = ""
    @recording = false