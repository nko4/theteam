require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Cloud",
    init: ->
      @requires 'Actor'
      @attr w: 100, h: 100
      @color '#ff0'
