require ['crafty'], (C) ->

  render = (template, time) ->
    $('.end-game-display-area').addClass('ended').html template {time}

  C.scene "win", ->
    time        = NKO.hud.getTime()
    score       = NKO.hud.getSpeedTime()
    state       = NKO.balloon._save()
    state.seed  = NKO.gameState.seed

    if NKO.isHighScore(score)
      render(templates.game_high_score, time)
      $('.get-famous').click (e) ->
        if name = $('.input-block input').val()
          NKO.submitHighScore score, name, state
          render(templates.game_win, time)
        e.preventDefault()
        false
    else
      render(templates.game_win)

    $('#hud').hide()
    stButtons.locateElements()
