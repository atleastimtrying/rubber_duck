class duck.FitnessStateMachine
  constructor: ->
    @visited_states = []
    @current_state = null
    @noun = null

  getNext: (@answer)->
    @current_state.post_action() if @current_state
    for state in @states(@)
      if state.qualifies()
        @current_state = state
        @visited_states.push state
        state.pre_action()
        out =
          next_question: state.question()
          answer_type: state.answer_type()
        return out

  states: (machine)->
    [
      {
        qualifies: ->
          @visited_states.length is 0
        pre_action: ->
        post_action: ->
          pattern = new duck.PatternMatcher(machine.answer)
          nouns = pattern.toLikelyNouns()
          nouns.sort((a,b)-> a.length - b.length)[0]
        question: ->
          "Can you describe the problem in a paragraph? Please use small sentences, I'm only a duck."
        answer_type: -> 'long'
      },
      {
        qualifies: ->
          @visited_states.length is 1 and machine.noun
        pre_action: ->
        post_action: ->
          machine.noun == null if answer.toLowerCase() is 'no'
        question: ->
          "Is #{machine.noun} the thing that has the problem?"
        answer_type: -> 'short'
      },
      {
        qualifies: ->
          @visited_states.length is 0 and !machine.noun
        pre_action: ->
        post_action: ->
          machine.noun
        question: ->
          "What should I call the function / object / thing that is misbehaving?"
        answer_type: -> 'short'
      }
    ]

