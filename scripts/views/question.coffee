class App.Views.Question extends Backbone.View
  tagName: 'li'
  className: 'question'
  template: _.template $("#question-template").html()

  events:
    "click .voteup": "upVote"
    "click .votedown": "downVote"

  render: =>
    data = @model.toJSON()
    data.tally = @model.voteTally()

    @$el.html this.template data

    userName = App.currentUser.get 'userName'
    @$('.voteup').toggleClass "selected", this.model.didUserVoteUp(userName)
    @$('.votedown').toggleClass "selected", this.model.didUserVoteDown(userName)
    @

  upVote: -> @setVote "up"
  downVote: -> @setVote "down"

  setVote: (voteType) ->
    @model.vote App.currentUser.get('userName'), voteType
    @render()
