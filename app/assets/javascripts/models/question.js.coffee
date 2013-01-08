class App.Models.Question extends Backbone.Model
  defaults:
    votes: []

  constrain: (value, min, max) ->
    return min if value < min
    return max if value > max
    value

  getExistingVote: (userName) ->
    _(@get('votes')).find (vote) -> vote.voter == userName

  vote: (userName, voteType) ->
    voteValue = if voteType == 'up' then 1 else -1
    existingVote = @getExistingVote userName

    if existingVote
      existingVote.value = @constrain(existingVote.value + voteValue, -1, 1)
    else
      @get('votes').push
        value: voteValue
        voter: userName
    @save()

  voteTally: ->
    reducer = (tally, vote) -> tally + vote.value
    this.get('votes').reduce reducer, 0

  didUserVote: (userName, voteValue) ->
    vote = @getExistingVote userName
    !!(vote && vote.value == voteValue)

  didUserVoteUp: (userName) -> @didUserVote userName, 1
  didUserVoteDown: (userName) -> @didUserVote userName, -1
