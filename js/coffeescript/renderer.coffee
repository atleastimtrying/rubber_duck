class window.duck.Renderer
  constructor: (@duck)->
    @container = $ '#duck'
    @question_template = $('#template_question').html()
    @answer_template = $('#template_answer').html()
    @long_template = $('#template_long').html()
    @short_template = $('#template_short').html()
    @duck.on 'print_question', @print_question
    @duck.on 'print_answer', @print_answer
    @duck.on 'print_short', @print_short
    @duck.on 'print_long', @print_long
    @duck.on 'strip_current', @strip_current
  print_question: (event, text)=>
    @container.append Mustache.render @question_template, question: text
  print_answer: (event, text)=>
    @container.append Mustache.render @answer_template, answer: text
  print_long: (event)=>
    @container.append Mustache.render @long_template, {}
  print_short: (event, text)=>
    @container.append Mustache.render @short_template, {}
  strip_current: =>
    val = $('#duck .current').val()
    @print_answer '', val
    $('#duck .current').remove()
