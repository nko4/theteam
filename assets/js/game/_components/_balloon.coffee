require ['crafty'], (C) ->

  C.c "Balloon",
    init: ->
      @requires 'Actor, SpriteAnimation, Fly, Float, Breathe, Collision, Flicker, balloon_4, Replayer, Recorder, WiredHitBox'
      @attr w: 124.1212121212121212, h: 146

      @sprite 0, 0
      @currentFrame = 0
      @flickerEnd = 0
      @flickerDuration = 60

      @bind 'inhale', @inhale
      @bind 'exhale', @exhale
      @bind 'AnimationEnd', (o) =>
        @trigger 'exhaleComplete' if o.reelId is "exhale"
      @bind 'FrameChange', @handleSizeChange
      @bind 'hearts:empty', -> C.scene('end')

      @yVelocity = 0

      @collision([36.954,0],[59.685,0],[83.214,0],[108.913,32.536],[106.74,73.893],[71.577,118.594],[51.16,118.594],[13.158999999999999,76.489],[11,34.057])

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
        if @_y > NKO.viewport.height # we reached the top - game over
          C.scene("end")
        else
          NKO.hud.updateAltitude Math.round((@_y*-1)/10)
          @setBackgroundColor()

      @onHit "Cloud", (evt) ->
        if not @flickering
          @flickering = true
          NKO.hud.removeHeart()
          @yVelocity = @yVelocity * 0.4

    handleSizeChange: (o) ->
      @currentFrame = o.frameNumber
      animationCompletion = (o.frameNumber+1) / @_reels[o.reelId].frames.length
      if o.reelId is 'inhale'
        @yVelocity -= 1
        @yVelocity = -1 if @yVelocity >= 0
      else if o.reelId is 'exhale'
        @yVelocity += 2
        @yVelocity = 2 if @yVelocity > 2

    inhale: ->
      @resetAnimation()
      @animate 'inhale', 0, 0, 31
      @playAnimation 'inhale', 90, 0

    exhale: ->
      @resetAnimation()
      @animate 'exhale', @currentFrame, 0, 0
      @playAnimation 'exhale', 90, 0

    setBackgroundColor: ->
      # 399 represents the inital bottom position
      viewPortPercent = -1 * (@_y - 399) / NKO.viewport.height
      C.background C.backgroundValues(viewPortPercent).hex()
