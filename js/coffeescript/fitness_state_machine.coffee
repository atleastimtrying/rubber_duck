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
        state.pre_action()
        return
          next_question: state.question()
          answer_type: state.answer_type()


  states: (machine)->
    [
      {
        qualifies: ->
          @visited_states.length is 0
        pre_action: ->
        post_action: ->
        question: ->
          "Can you describe the problem in a paragraph? Please use small sentances, I'm only a duck."
        answer_type: -> 'short'
      },
      {
        qualifies: ->
          @visited_states.length is 0
        pre_action: ->
        post_action: ->
        question: ->
          "Is #{machine.noun} the thing that has the problem?"
      }
    ]

