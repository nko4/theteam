require ['crafty'], (C) ->

  C.c "Balloon",
    init: ->
      @requires 'Actor, SpriteAnimation, Fly, Float, Breathe, balloon_4'
      @attr w: 124.1212121212121212, h: 146
      @sprite 0, 0
      @currentFrame = 0
      @bind 'inhale', @inhale
      @bind 'exhale', @exhale
      @bind 'AnimationEnd', (o) =>
        @trigger 'exhaleComplete' if o.reelId is "exhale"
      @bind 'FrameChange', @handleSizeChange

      @yVelocity = 0

      @bind 'EnterFrame', =>
        C.viewport.pan "y", @yVelocity, 1
        @y = @_y + @yVelocity
        @setBackgroundColor()

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
      # 6000 is the viewport height ATM
      viewPortPercent = -1 * (@_y - 399) / 6000
      C.background C.backgroundValues(viewPortPercent).hex()
