require ['crafty'], (C) ->

  C.c "Balloon",
    init: ->
      @requires 'Replayer, Recorder, Actor, SpriteAnimation, Fly, Float, Breathe, Collision, Flicker, balloon_4'
      @attr w: 124.1212121212121212, h: 146

      @sprite 0, 0
      @currentFrame = 0
      @flickerEnd = 0
      @flickerDuration = 60
      @setFrameBoundry 0
      @bind 'inhale', @inhale
      @bind 'exhale', @exhale
      @bind 'AnimationEnd', (o) =>
        @trigger 'exhaleComplete' if o.reelId is "exhale"
      @bind 'FrameChange', @handleSizeChange
      @bind 'hearts:empty', -> C.scene('end')

      @yVelocity = 0
      @yMax      = -10
      @yMaxDown  = 3

      C.viewport.followX this, 0, 200

      @bind 'EnterFrame', (e) =>
        # Handle flickering
        if @flickering
          if not @flickerEnd
            @flickerEnd = e.frame + @flickerDuration
          else if e.frame > @flickerEnd
            @flickerEnd = 0
            @flickering = false

        # Update movement and HUD
        @y = @_y + @yVelocity
        if (@_y*-1) > NKO.viewport.height # we reached the top - game over
          C.scene("end")
        else
          NKO.hud.updateAltitude Math.round(@_y*-1)
          @setBackgroundColor()

      @onHit "Cloud", (evt) ->
        if not @flickering
          @flickering = true
          NKO.hud.removeHeart()
          @yVelocity = @yVelocity * 0.4

    setFrameBoundry: (frame) ->
      if frame < 6
        @collision([50.403,118.594],[26.502,73.59],[25,33.375],[41.251999999999995,0],[59.436,0],[77.214,0],[93.467,33.375],[91.964,73.59],[68.063,118.594])
      else if frame < 11
        @collision([54.554,118.594],[26.725,73.59],[25,33.375],[45.355000000000004,0],[64.36699999999999,0],[84.226,0],[103.456,33.375],[101.73,73.59],[73.90100000000001,118.594])
      else if frame < 16
        @collision([54.554,118.594],[26.725,73.59],[25,33.375],[45.355000000000004,0],[64.36699999999999,0],[84.226,0],[103.456,33.375],[101.73,73.59],[73.90100000000001,118.594])
      else if frame < 21
        @collision([38.951,0],[62.969,0],[88.193,0],[118.197,34.733],[114.156,79.422],[79.854,118.338],[48.74,118.852],[12.359,78.898],[10,34.481])
      else if frame < 26
        @collision([36.626999999999995,0],[88.354,0],[119.98,35.474],[115.996,84.042],[84.02,118.595],[41.336,118.595],[9.852,85.405],[5,35.474])
      else if frame < 31
        @collision([34.225,0], [88.311,0], [122.535,36.224], [119.039,85.759], [84.064,118.595], [38.471,118.595], [3.496,85.759], [0,36.224])
      else
        @collision([34.225,0], [88.311,0], [122.535,36.224], [119.039,85.759], [84.064,118.595], [38.471,118.595], [3.496,85.759], [0,36.224])

    handleSizeChange: (o) ->
      @currentFrame = o.frameNumber
      @setFrameBoundry o.frameNumber

      animationCompletion = (o.frameNumber+1) / @_reels[o.reelId].frames.length
      if o.reelId is 'inhale'
        @yVelocity = @yMax * animationCompletion
      else if o.reelId is 'exhale'
        if @yVelocity < 0
          @lastV = @yVelocity
        else
          @lastV = 0
        @yVelocity = @yMaxDown * animationCompletion + @lastV

    inhale: ->
      @resetAnimation()
      @animate 'inhale', 0, 0, 31
      @playAnimation 'inhale', 90, 0

    exhale: ->
      @resetAnimation()
      @animate 'exhale', @currentFrame, 0, 0
      @playAnimation 'exhale', 120, 0

    setBackgroundColor: ->
      # 399 represents the inital bottom position
      viewPortPercent = -1 * (@_y - 399) / NKO.viewport.height
      C.background C.backgroundValues(viewPortPercent).hex()
