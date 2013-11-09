require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Cloud",
    init: -> 
      @requires '2D, DOM, Color'
      @attr x: 0, y: 0, w: 100, h: 100
      @color '#ff0'
