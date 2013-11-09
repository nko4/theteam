require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Balloon",
    init: -> 
      @requires '2D, DOM, Color, Twoway'
      @attr x: 0, y: 0, w: 100, h: 100
      @color '#f00'
      @twoway 5
