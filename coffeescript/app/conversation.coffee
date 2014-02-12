class Conversation
  constructor: ->
    @conversation = []

  add: (question, answer) ->
    @conversation.push [question, answer]