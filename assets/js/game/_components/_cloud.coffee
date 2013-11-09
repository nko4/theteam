require ['crafty'], (C) ->

  C.c "Cloud",
    init: ->
      @requires 'Actor, Collision'
      @attr w: 183, h: 126

      @onHit "Balloon", (t) ->
        t[0].obj.trigger 'hitCloud',
          normal:  t[0].normal
          overlap: t[0].overlap
