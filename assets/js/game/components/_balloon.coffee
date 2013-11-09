require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Balloon",
    init: ->
      @requires '2D, DOM, Twoway, mid_b'
      @attr w: 136, h: 190
      @twoway 5, 0
