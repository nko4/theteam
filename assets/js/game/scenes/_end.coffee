NKO.Game.Scenes.push (C) ->
  C.scene "end", ->
    if NKO.gameState.replay
      history.go(0)
    else
      $('.end-game-display-area').addClass('ended').html(
        templates.game_over(
          miles: NKO.hud.getScore()
          highScores: _(NKO.highScores).values().first(8).map( (s) -> NKO.toHHMMSS(s.score) ).valueOf()
          names: _(NKO.highScores).values().first(8).map( (s) -> s.name ).valueOf()
        )
      )

      $('#hud').hide()

      stButtons.locateElements()
