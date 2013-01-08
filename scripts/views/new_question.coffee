class App.Views.NewQuestion extends Backbone.View
  initialize: (options) ->
    App.currentUser.on "change", @render
    @render()
  render: =>
    $("#asker").text App.currentUser.get("userName")
    @$el.toggleClass "hidden", !App.currentUser.isLoggedIn()
    @
