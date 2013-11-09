require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Cloud",
    init: ->
      @requires 'Actor, Collision'
      @attr w: 183, h: 126

      @bind "EnterFrame", (e) ->
        # console.log "Cloud EnterFrame", e.frame, @x, @y

      @onHit "Balloon", (e) ->
        # console.log "Cloud onHit Balloon"
