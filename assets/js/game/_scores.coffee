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
