class Duck
  constructor: (ui_class)->
    @ui = new ui_class()
    @processor = new Processor()


  ask: (question) ->
    @processor.getAnswer question

$ ->
  new Duck(HtmlUI)