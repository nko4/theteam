require ['crafty'], (C) ->

  C.scene "win", ->
    # if high score
    # templates.game_high_score

    $('.end-game-display-area').addClass('ended').html(
      templates.game_win(
        time: NKO.hud.getTime()
      )
    )

    $('#hud').hide()
    stButtons.locateElements()
