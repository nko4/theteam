require ['crafty'], (C) ->

  C.scene "win", ->
    template = if NKO.isHighScore(NKO.hud.getSpeedTime()) then templates.game_high_score else  templates.game_win

    $('.end-game-display-area').addClass('ended').html(
      template(
        time: NKO.hud.getTime()
      )
    )

    $('#hud').hide()
    stButtons.locateElements()
