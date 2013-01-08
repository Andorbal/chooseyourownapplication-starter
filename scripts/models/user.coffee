class App.Models.User extends  Backbone.Model
  logIn: (userName) ->
    return unless userName
    @set 'userName', userName
  isLoggedIn: ->
    @has 'userName'
