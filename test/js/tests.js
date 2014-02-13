// Generated by CoffeeScript 1.3.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.duck.App = (function() {

    function App() {
      this.bill = new duck.Bill(this);
      this.brain = new duck.Brain(this);
    }

    return App;

  })();

  $(function() {
    return window.duck = new duck.App;
  });

  duck.Bill = (function() {

    function Bill(duck) {
      this.duck = duck;
      this.navigation = new window.duck.Navigation(this.duck);
      this.success = new window.duck.Success(this.duck);
    }

    return Bill;

  })();

  duck.Brain = (function() {

    function Brain(duck) {
      this.duck = duck;
      $(this.duck).on('quack', this.quack);
    }

    Brain.prototype.quack = function(event, options) {
      console.log(options.message);
      return options.render("I'm sorry, Dave, I just don't know.");
    };

    return Brain;

  })();

  duck.Conversation = (function() {

    function Conversation() {
      this.conversation = [];
    }

    Conversation.prototype.add = function(question, answer) {
      return this.conversation.push({
        question: question,
        answer: answer
      });
    };

    return Conversation;

  })();

  window.duck.Navigation = (function() {

    function Navigation(duck) {
      this.duck = duck;
      this.go = __bind(this.go, this);

      this.bindUI = __bind(this.bindUI, this);

      this.bindUI();
    }

    Navigation.prototype.bindUI = function() {
      return $('nav a').click(this.go);
    };

    Navigation.prototype.go = function(event) {
      var link, target;
      event.preventDefault();
      link = $(event.currentTarget);
      target = $(link.attr('href'));
      return $('html, body').animate({
        scrollTop: target.offset().top
      }, 2000);
    };

    return Navigation;

  })();

  window.duck.Success = (function() {

    function Success(duck) {
      this.duck = duck;
      this.done = __bind(this.done, this);

      this.bindUI = __bind(this.bindUI, this);

      this.bindUI();
    }

    Success.prototype.bindUI = function() {
      return $('.done').click(this.done);
    };

    Success.prototype.done = function(event) {
      event.preventDefault();
      return $('.congratulations').slideDown();
    };

    return Success;

  })();

  describe("The Brain", function() {
    it("can be instantiated", function() {
      return expect(function() {
        return new duck.Brain();
      }).not.toThrow();
    });
    return describe("when processing text", function() {
      beforeEach(function() {
        return this.brain = new duck.Brain();
      });
      return it("can give an answer", function() {
        var answer;
        answer = this.brain.giveAnswer;
        expect(answer.toString()).toEqual(answer);
        return expect(answer.length).toBeGreaterThan(1);
      });
    });
  });

  describe("The duck", function() {});

}).call(this);
