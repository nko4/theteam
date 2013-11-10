require ['crafty', 'goinstant', 'uuid'], (C) ->

  NKO.database.connect ->
    @get 'highScores', (error, highScores) ->
      unless error
        NKO.highScores = highScores

  NKO.isHighScore = (score) ->
    if NKO.highScores
      scores = _(NKO.highScores).values().sort('score').first(10)

      !!(scores.value().length < 10 or scores.find (s) -> s.score < score)
    else
      return true

  NKO.submitHighScore = (score, name, state, callback) ->

    id = UUID()

    NKO.database.connect ->
      @set "highScores/#{id}", {name, score}
      @set "gameStates/#{id}", state

      # clean up old high scores
      if NKO.highScores?.length > 100
        squashId = (s, id) ->
          s.id = id
          s

        remove = _(NKO.highScores).map(squashId).sort('score').rest(100).pluck('id')

        if remove
          for id in remove
            @remove("highScores/#{id}", ->) if id
            @remove("gameStates/#{id}", ->) if id
