class duck.FitnessStateMachine
  constructor: ->
    @visited_states = []
    @current_state = null
    @what_it_does = null
    @potential_nouns = []
    @noun = null

  getNext: (@answer)->
    @current_state.post_action() if @current_state
    for state in @states(@)
      if state.qualifies()
        @current_state = state
        @visited_states.push state.name
        state.pre_action()
        out =
          next_question: state.question()
          answer_type: state.answer_type
          options: state.options
        return out
    next_question: "Sorry, my super-duck-powers have failed. Have you tried google or stack overflow?"
    answer_type: 'reset'

  states: (machine)->
    [
      {
        qualifies: ->
          machine.visited_states.length is 0
        pre_action: ->
        post_action: ->
          pattern = new duck.PatternMatcher(machine.answer)
          machine.potential_nouns = pattern.toLikelyNouns()
        question: ->
          "Can you describe the problem in a paragraph? Please use small sentences, I'm only a duck."
        answer_type: 'long'
      },
      {
        name: 'is it this one?'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.potential_nouns.length is 1
        pre_action: ->
          machine.noun = machine.potential_nouns[0]
        post_action: ->
          machine.noun = null if machine.answer is 'no'
        question: ->
          "Is #{machine.noun} the thing that has the problem?"
        answer_type: 'choice'
        options: -> ['yes', 'no']
      },
      {
        name: 'name your noun'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.visited_states.length is 1 and machine.noun
          machine.potential_nouns.length > 1
        pre_action: ->
        post_action: ->
          machine.noun = machine.answer
          machine.noun = null if machine.noun is 'none of the above'
        question: ->
          "Is the problematic object one of these?"
        answer_type: 'choice'
        options: -> machine.potential_nouns.sort((a,b)-> a.length - b.length).concat 'none of the above'
      },
      {
        qualifies: ->
          !machine.noun
        pre_action: ->
        post_action: ->
          machine.noun = machine.answer if machine.answer and machine.answer.trim() isnt ''
        question: ->
          "What should I call the function / object / thing that is misbehaving?"
        answer_type: 'short'
      },
      {
        name: 'what does it do?'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
          machine.what_it_does = machine.answer
        question: ->
          "Can you explain what #{machine.noun} does?"
        answer_type: 'long'
      },
      {
        name: 'what it does sounds complicated'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun && machine.what_it_does.length > 100
        pre_action: ->
        post_action: ->
        question: ->
          "Wow, that sounds complicated. Any chance that #{machine.noun} can be broken into smaller parts that you could test separately?"
        answer_type: 'short'
      },
      {
        name: 'what it does sounds reasonable'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun && machine.what_it_does.length <= 100 && machine.what_it_does.length > 30
        pre_action: ->
        post_action: ->
        question: ->
          "So does it do just one thing? Any chance that #{machine.noun}, or parts of it, can be isolated and test separately?"
        answer_type: 'short'
      },
      {
        name: 'what it does sounds short'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun && machine.what_it_does.length <= 30
        pre_action: ->
        post_action: ->
        question: ->
          "Do you fully understand how it does what it does? Could you split #{machine.noun} into smaller chunks?"
        answer_type: 'short'
      },
      {
        name: 'what is known'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
        question: ->
          "What parts of #{machine.noun} are you certain work, and where are your 'unknowns'?"
        answer_type: 'short'
      },
      {
        name: 'is it compiling'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
        question: ->
          "Is #{machine.noun} being compiled? Can you restart the compiler?"
        answer_type: 'short'
      },
      {
        name: 'is it reusable'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
        question: ->
          "Is something similar to #{machine.noun} being used elsewhere? Could common elements be shared?"
        answer_type: 'short'
      },
      {
        name: 'how is it modified'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
        question: ->
          "How is #{machine.noun} modified?"
        answer_type: 'short'
      },
      {
        name: 'are vars overwritten'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
        question: ->
          "Could #{machine.noun}, or variables within it, be somehow overwritten or overridden?"
        answer_type: 'short'
      },
      {
        name: 'did you pack this bag yourself'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
        question: ->
          "Is everything in #{machine.noun} your code? Could you replace uncertainties with debugging statements?"
        answer_type: 'short'
      },
      {
        name: 'why do you need it'
        qualifies: ->
          return false unless machine.visited_states.indexOf(@name) is -1
          machine.noun
        pre_action: ->
        post_action: ->
          machine.what_it_does = machine.answer
        question: ->
          "Why do you need #{machine.noun}?"
        answer_type: 'long'
      }
    ]

