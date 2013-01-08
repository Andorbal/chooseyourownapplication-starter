class App.Views.Questions extends Backbone.View
  initialize: ->
    @model.on "reset", @render
    @model.on "add", @renderItem

  render: =>
    @$el.html ""
    @model.each @renderItem
    @

  renderItem: (item) =>
    newView = new App.Views.Question model: item
    @$el.append newView.render().el
