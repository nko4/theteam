require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Spawner",
    whiteCloudStyles: ['w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8']
    blueCloudStyles:  ['b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8']
    starStyles: ['s1', 's2', 's3', 's4']

    spawnRate: 60

    _pick: (from) ->
      from[Math.floor(Math.random() * from.length)]

    init: ->
      # This is the game loop for every frame.  Do cloud creation here
      @bind "EnterFrame", (e) ->
        rate = parseInt(@spawnRate, 10)
        if e.frame % rate is 0
          # display a new cloud/star
          style = @_pick(@whiteCloudStyles) # Style should be based on what level of space vertically you are on
          cloud = C.e("Cloud, "+style)
          cloud.attr
            w: 183 # need to reset w/h since the Sprite component is loaded after the 2D component
            h: 126
            x: 100
            y: 100
            taret: "Balloon"
