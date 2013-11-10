NKO.Game.Scenes.push (C) ->

  render = (template, opts={}) ->
    $('.end-game-display-area').addClass('ended').html template(opts)
    $('.overlay').on "click", ->
      i = $(@).data('index')
      id = $(@).data('src')

      return if $('iframe').eq(i).attr('src')?.length

      $('iframe').attr('src', '')
      if (id)
        $('iframe').eq(i).attr 'src', document.URL + "?gameState=" + id

    $('#hud').hide()

  C.scene "win", ->
    if NKO.gameState.replay
      history.go(0)
    else
      time        = NKO.hud.getTime()
      score       = NKO.hud.getSpeedTime()
      state       = NKO.balloon._save()
      state.seed  = NKO.gameState.seed

      if NKO.isHighScore(score)
        render(templates.game_high_score, time: time)
        $('.get-famous').click (e) ->
          if name = $('.input-block input').val()
            NKO.submitHighScore score, name, state

            scores = _(NKO.highScores).values().sortBy("score")
            keys = _(NKO.highScores).each((v,k) -> v.key=k ).values().sortBy("score").first(8).valueOf()

            render(templates.game_win,
              time: time
              highScores: scores.first(8).map( (s) -> NKO.toHHMMSS(s.score) ).valueOf()
              names: scores.first(8).map( (s) -> s.name ).valueOf()
              keys: _(keys).pluck('key').valueOf()
            )
          e.preventDefault()
          false
      else
        scores = _(NKO.highScores).values().sortBy("score")
        keys = _(NKO.highScores).each((v,k) -> v.key=k ).values().sortBy("score").first(8).valueOf()

        render(templates.game_win,
          time: time
          highScores: scores.first(8).map( (s) -> NKO.toHHMMSS(s.score) ).valueOf()
          names: scores.first(8).map( (s) -> s.name ).valueOf()
          keys: _(keys).pluck('key').valueOf()
        )

      $('#hud').hide()
      stButtons.locateElements()
