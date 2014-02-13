class Conversation
  constructor: ->
    @conversation = []

  add: (question, answer) ->
    @conversation.push { question: question,  answer: answer}