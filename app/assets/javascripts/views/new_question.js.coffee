class App.Views.NewQuestion extends Backbone.View
  events:
    "click #addItem": "addItem"
  initialize: (options) ->
    App.currentUser.on "change", @render
    @render()
  render: =>
    $("#asker").text App.currentUser.get("userName")
    @$el.toggleClass "hidden", !App.currentUser.isLoggedIn()
    @
  addItem: ->
    question =
      text: @$("#newQuestion").val()
      userName: App.currentUser.get("userName")
    @model.create question
    @$("#newQuestion").val ''
