NKO.Game.Scenes.push (C) ->
  C.scene "end", ->
    if NKO.gameState.replay
      history.go(0)
    else
      scores = _(NKO.highScores).values().sortBy("score")
      keys = _(NKO.highScores).each((v,k) -> v.key=k ).values().sortBy("score").first(8).valueOf()
      $('.end-game-display-area').addClass('ended').html(
        templates.game_over(
          miles: NKO.hud.getScore()
          highScores: scores.first(8).map( (s) -> NKO.toHHMMSS(s.score) ).valueOf()
          names: scores.first(8).map( (s) -> s.name ).valueOf()
          keys: _(keys).pluck('key').valueOf()
        )
      )

      $('.overlay').on "click", ->
        i = $(@).data('index')
        id = $(@).data('src')

        return if $('iframe').eq(i).attr('src')?.length

        $('iframe').attr('src', '')
        if (id)
          $('iframe').eq(i).attr 'src', document.URL + "?gameState=" + id

      $('#hud').hide()

      stButtons.locateElements()
