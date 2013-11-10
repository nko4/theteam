require ['crafty'], (C) ->

  C.c "Balloon",
    init: ->
      @requires 'Actor, SpriteAnimation, Fly, Float, Breathe, Replayer, Recorder, balloon_4, Collision, WiredHitBox'
      @attr w: 124.1212121212121212, h: 146
      @sprite 0, 0
      @currentFrame = 0
      @bind 'inhale', @inhale
      @bind 'exhale', @exhale
      @bind 'AnimationEnd', (o) =>
        @trigger 'exhaleComplete' if o.reelId is "exhale"
      @bind 'FrameChange', @handleSizeChange

      @bind "hitCloud", @_onCloudHit

      @yVelocity = 0

      C.viewport.followX this, 0, 200
      @bind 'EnterFrame', =>
        @y = @_y + @yVelocity
        if @_y > NKO.viewport.height # we reached the top - game over
          C.scene("end")
        else
          NKO.hud.updateAltitude Math.round((@_y*-1)/10)
          @setBackgroundColor()

    _onCloudHit: (o) ->
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
