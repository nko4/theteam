require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Spawner",
    whiteCloudStyles: ['w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8']
    blueCloudStyles:  ['b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8']
    cloudSpacing:     [40, 60, 80, 100, 120]
    starStyles:       ['s1', 's2', 's3', 's4']
    starSpacing:      [2, 3, 5, 7, 9, 12]

    spawnRate: 60
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
      style = @_pick(if type is 'white' then @whiteCloudStyles else @blueCloudStyles)
      cloud = C.e("Cloud, "+style)
      cloud.attr
        w: 183 # need to reset w/h since the Sprite component is loaded after the 2D component
        h: 126
        x: (Math.random() * (C.viewport.width + 183)) - 91.5
        y: @position
        taret: "Balloon"

      @position -= @_pick(@cloudSpacing) #/ @elementsShown

    _addStar: ->
      style = @_pick(@starStyles)
      star = C.e("Cloud, "+style)
      star.attr
        w: 74 # need to reset w/h since the Sprite component is loaded after the 2D component
        h: 74
        x: (Math.random() * (C.viewport.width + 74)) - 37
        y: @position
        taret: "Balloon"

      @position -= @_pick(@cloudSpacing) #/ @elementsShown
