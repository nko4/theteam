require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Spawner",
    elements:
      white:
        styles:   ['w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8']
        spacing:  [80, 100, 120, 140]
      blue:
        styles:   ['b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8']
        spacing:  [40, 60, 80, 100]
      star:
        styles:   ['s1', 's2', 's3', 's4']
        spacing:  [5, 10, 15, 20, 25]

    elementsShown: 0
    position: 0

    _pick: (from) ->
      from[Math.floor(Math.random() * from.length)]

    spawnElement: (num) ->
      @elementsShown++

      if num < 33
        @_addCloud()
      else if num < 67
        @_addCloud('blue')
      else
        @_addStar()


    _addCloud: (type='white') ->
      style = @_pick(@elements[type].styles)
      cloud = C.e("Cloud, "+style)
      cloud.attr
        w: 183 # need to reset w/h since the Sprite component is loaded after the 2D component
        h: 126
        x: (Math.random() * (C.viewport.width + 183)) - 91.5
        y: @position
        taret: "Balloon"

      @position -= @_pick(@elements[type].spacing) #/ @elementsShown

    _addStar: ->
      style = @_pick(@elements.star.styles)
      star = C.e("Cloud, "+style)
      star.attr
        w: 74 # need to reset w/h since the Sprite component is loaded after the 2D component
        h: 74
        x: (Math.random() * (C.viewport.width + 74)) - 37
        y: @position
        taret: "Balloon"

      @position -= @_pick(@elements.star.spacing) #/ @elementsShown
