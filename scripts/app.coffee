$ ->
  App.currentUser = new App.Models.User()
  loginView = new App.Views.Login
    el: $('#loginView')
    model: App.currentUser
