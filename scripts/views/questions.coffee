class App.Views.Questions extends Backbone.View
  initialize: ->
    @model.on "add", @renderItem

  render: =>
    @

  renderItem: (item) =>
    newView = new App.Views.Question model: item
    @$el.append newView.render().el
