require ['crafty'], (C) ->

  C.c "Moon",
    init: ->
      @requires 'Actor, Image'
      @attr w: 486, h: 95, x: 157, y: -6425
      @image "img/moon-header.png"
