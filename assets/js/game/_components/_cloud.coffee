require ['crafty'], (C) ->

  C.c "Cloud",
    init: ->
      @requires 'Actor, Collision, WiredHitBox'
      @attr w: 183, h: 126
