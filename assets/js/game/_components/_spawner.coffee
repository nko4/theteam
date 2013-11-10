require ['crafty'], (C) ->

  C.c "Spawner",
    elements:
      white:
        styles:   ['w1', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8']
        spacing:  [80, 100, 120, 140]
      blue:
        styles:   ['b1', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8']
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

      switch style
        when 'b1', 'w1'
          cloud.collision([72.873,0], [144.022,4.761], [161.377,82.511], [144.655,103.761], [54.469,127.058], [9.699,110.031], [0,33.761], [21.5,6.261])
        when 'b3', 'w3'
          cloud.collision([62.285,0], [140.989,41.207], [116.103,81.963], [74.562,97.957], [17.103,85.963], [0,38.457])
        when 'b4', 'w4'
          cloud.collision([154.611,0], [70.461,5.027], [4.829,40.718], [0,107.718], [42.557,125.501], [171,120.092], [183.33,93.115])
        when 'b5', 'w5'
          cloud.collision([146.492,21.325], [82.007,0], [8.716,22.882], [0,47.849], [48.337,102.305], [116.88,102.305], [145.942,72.713])
        when 'b6', 'w6'
          cloud.collision([174, 0], [184, 43], [176, 93], [49, 109], [21, 98], [0, 18], [22, 4])
        when 'b7', 'w7'
          cloud.collision([37.555,0.5], [0,65.497], [90.368,112.164], [168.498,70.664], [146.331,0])
        when 'w8', 'b8'
          cloud.collision([124.5, 0], [189, 84.65], [174.5, 111.65], [83, 140], [0, 115], [2.5, 35], [55, 12])

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
