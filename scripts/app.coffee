$ ->
  App.currentUser = new App.Models.User()
  questions = new App.Collections.Questions()

  loginView = new App.Views.Login
    el: $('#loginView')
    model: App.currentUser
  newQuestionView = new App.Views.NewQuestion
    el: $('#newQuestionView')
    model: questions
  questionsView = new App.Views.Questions
    el: $('#questions')
    model: questions
