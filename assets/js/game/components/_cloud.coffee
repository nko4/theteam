require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Cloud",
    init: -> 
      @requires '2D, DOM, Color'
      @bind

