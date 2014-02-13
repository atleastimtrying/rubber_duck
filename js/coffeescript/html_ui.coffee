class HtmlUI
  constructor: (@duck)->
    @bind()

  bind: -> 
    $('#duck form').on "submit", =>
      question = @getQuestion()
      answer = @duck.ask(question)
      @updateConversation()

  getQuestion: -> $('#duck input[type=text]').val()

  updateConversation: -> 
    $('#quack').html @duck.conversation.applyFormatter HtmlFormatter


class HtmlFormatter
  @latest: (txt)->
    "<div class='latest'>#{txt}</div>"
  @question: (txt)-> 
    "<div class='question'><label>Q:</label> #{txt}</div>"
  @answer: (txt)-> 
    "<div class='question'><label>A:</label> #{txt}</div>"
  @keyword: (txt)->
    "<strong>#{txt}</strong>"
