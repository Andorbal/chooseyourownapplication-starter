class App.Views.Question extends Backbone.View
  tagName: 'li'
  className: 'question'
  template: _.template $("#question-template").html()

  render: =>
    @$el.html @template @model.toJSON()
    @
