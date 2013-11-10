require ['crafty'], (C) ->

  C.scene "win", ->
    $('.end-game-display-area').addClass('ended').html(
      templates.game_win(
        time: NKO.hud.getTime()
      )
    )

    $('#hud').hide()
    stButtons.locateElements()
