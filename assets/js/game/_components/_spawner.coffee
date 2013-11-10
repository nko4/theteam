NKO.Game.Components.push (C) ->

  C.c "Spawner",
    elements:
      white:
        styles:   ['w1', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8']
        spacing:  [80, 100, 120, 140]
      blue:
        styles:   ['b1', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8']
        spacing:  [80, 100, 120, 140]
      star:
        styles:   ['s1', 's2', 's3', 's4']
        spacing:  [20, 30, 40, 50]

    elementsShown: 0
    position: 0

    _pick: (from, rand) ->
      from[Math.floor(rand * from.length)]

    spawnElement: (num) ->
      @elementsShown++

      rand = NKO.seededNumbers[num]

      # Board is split into 30+30+40 (white + blue + stars)
      if num < NKO.numberOfClouds * .3
        @_addCloud(rand)
      else if num < NKO.numberOfClouds * .6
        @_addCloud(rand, 'blue')
      else
        @_addStar(rand)


    _addCloud: (rand, type='white') ->
      style = @_pick(@elements[type].styles, rand)
      xPos = (rand * (C.viewport.width + 183)) - 91.5
      cloud = C.e("Cloud, "+style)
      cloud.attr
        w: 183 # need to reset w/h since the Sprite component is loaded after the 2D component
        h: 126
        x: xPos
        y: @position
        target: "Balloon"

      switch style
        when 'b1', 'w1'
          cloud.collision([72.873,0], [144.022,4.761], [161.377,82.511], [144.655,103.761], [54.469,127.058], [9.699,110.031], [0,33.761], [21.5,6.261])
        when 'b3', 'w3'
          cloud.collision([82.285,10],[160.989,51.207],[136.103,91.963],[94.562,107.957],[37.103,95.963],[20,48.457])
        when 'b4', 'w4'
          cloud.collision([154.611,0], [70.461,5.027], [4.829,40.718], [0,107.718], [42.557,125.501], [171,120.092], [183.33,93.115])
        when 'b5', 'w5'
          cloud.collision([166.492,31.325],[102.007,10],[28.716,32.882000000000005],[20,57.849],[68.337,112.305],[136.88,112.305],[165.942,82.713])
        when 'b6', 'w6'
          cloud.collision([174,10],[184,53],[176,103],[49,119],[21,108],[0,28],[22,14])
        when 'b7', 'w7'
          cloud.collision([37.555,0.5], [0,65.497], [90.368,112.164], [168.498,70.664], [146.331,0])
        when 'w8', 'b8'
          cloud.collision([124.5, 0], [189, 84.65], [174.5, 111.65], [83, 140], [0, 115], [2.5, 35], [55, 12])

      @position -= @_pick(@elements[type].spacing, rand)

    _addStar: (rand) ->
      style = @_pick(@elements.star.styles, rand)
      xPos = (rand * (C.viewport.width + 74)) - 37
      star = C.e("Cloud, "+style)
      star.attr
        w: 74 # need to reset w/h since the Sprite component is loaded after the 2D component
        h: 74
        x: xPos
        y: @position
        target: "Balloon"

      switch style
        when 's1'
          star.collision([31.515,47.400999999999996],[25,36.116],[31.515,25],[44.546,25],[51.061,36.116],[44.546,47.400999999999996])
        when 's2'
          star.collision([34.674,15],[57.04,23.734],[56.215,48.066],[33.077,54.691],[20,33.927])
        when 's3'
          star.collision([39.663,15],[59.291,29.544],[51.116,52.326],[27.018,51.869],[20,28.822])
        when 's4'
          star.collision([42.894,15],[57.775,33.4],[44.617999999999995,53.873],[21.217,47.669],[20,23.026])

      @position -= @_pick(@elements.star.spacing, rand)
