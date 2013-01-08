class App.Models.Question extends Backbone.Model
  defaults:
    votes: []

  vote: (userName, voteType) ->
    voteValue = if voteType == 'up' then 1 else -1
    @get('votes').push
      value: voteValue
      voter: userName
    @save()

  voteTally: ->
    reducer = (tally, vote) -> tally + vote.value
    this.get('votes').reduce reducer, 0
