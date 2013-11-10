require ['crafty'], (C) ->

  C.c "Cloud",
    init: ->
      @requires 'Actor, Collision'
      @attr w: 183, h: 126
