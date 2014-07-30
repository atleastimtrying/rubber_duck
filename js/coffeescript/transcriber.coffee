class duck.Transcriber
  constructor: ->
    $('.prefixtext').on 'click', => @transcribe @prefix
    $('.italictext').on 'click', => @transcribe @italic
  prefix: (i, a)->
    prefix = "Question #{i} : "
    prefix = "Answer #{i} : " if $(a).hasClass('answer')
    prefix + $(a).text()
  italic: (i, a)->
    if $(a).hasClass('answer') then "<em>#{$(a).text()}</em>" else $(a).text()
  fetchText: (formatter)->
    $('.question, .answer').map(formatter).toArray().join '<br>\n'
  transcribe: (formatter)->
    text = @fetchText formatter
    window.open "data:text/html, #{text}"