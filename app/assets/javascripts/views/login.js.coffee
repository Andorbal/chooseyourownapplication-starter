class App.Views.Login extends Backbone.View
  events:
    "click #logIn": "login"
  initialize: ->
    @model.on "change", @render
  render: =>
    @$el.toggleClass "hidden", this.model.isLoggedIn()
    @
  login: ->
    @model.logIn @$("#userName").val()
