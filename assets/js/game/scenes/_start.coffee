require ['crafty'], (C) ->
  C.scene "start", ->
    $('.pre-game-container').html(templates.start())

    $('.start').one "click", =>
      $('.pre-game-container').html("")
      C.scene 'main'
