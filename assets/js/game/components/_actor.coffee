require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Actor",
    init: ->
      @requires '2D, DOM, Color'
