$ ->
  App.currentUser = new App.Models.User()
  questions = new App.Collections.Questions()

  loginView = new App.Views.Login
    el: $('#loginView')
    model: App.currentUser
  newQuestionView = new App.Views.NewQuestion
    el: $('#newQuestionView')
    model: questions
