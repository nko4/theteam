NKO.Game.Scenes.push (C) ->
  C.scene "end", ->
    $('.end-game-display-area').addClass('ended').html(
      templates.game_over(
        miles: NKO.hud.getScore()
      )
    )

    $('#hud').hide()

    stButtons.locateElements()
