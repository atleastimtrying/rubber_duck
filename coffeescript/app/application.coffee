class Duck 
  constructor: (ui_class)-> 
    @ui = new ui_class()


  ask: (question) ->
    @processor.getAnswer question

$ -> 
  new Duck(HtmlUI)