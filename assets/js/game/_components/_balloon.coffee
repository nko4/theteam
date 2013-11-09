require ['jquery', 'lodash', 'crafty'], ($, _, C) ->
  C.c "Balloon",
    init: ->
      @requires 'Actor, SpriteAnimation, Fly, Float, Breathe, balloon_4'
      @attr w: 136, h: 190
      @bind 'inhale', @inhale
      @bind 'exhale', @exhale
      @bind 'AnimationEnd', (o) =>
        @trigger 'exhaleComplete' if o.reelId is "exhale"
      @bind 'FrameChange', @handleSizeChange

      @yVelocityMin =  2
      @yVelocity    = -3
      @vVelocityMax = -5

      @bind 'EnterFrame', =>
        C.viewport.pan "y", @yVelocity, 1
        @y = @_y + @yVelocity
        @setBackgroundColor()

    handleSizeChange: (o) ->
      animationCompletion = (o.frameNumber+1) / @_reels[o.reelId].frames.length
      if o.reelId is 'exhale'
        @yVelocity = ~~(@yVelocity - @vVelocityMax * animationCompletion)
      else
        @yVelocity = ~~(@yVelocity + @vVelocityMax * animationCompletion)

      @yVelocity = @yVelocityMin if @yVelocity > @yVelocityMin

    inhale: ->
      @animate 'inhale', 4, 0, 7
      @playAnimation 'inhale', 20, 0

    exhale: ->
      @animate 'exhale', 7, 0, 4
      @playAnimation 'exhale', 40, 0

    setBackgroundColor: ->
      # 399 represents the inital bottom position
      # 6000 is the viewport height ATM
      viewPortPercent = -1 * (@_y - 399) / 6000
      C.background C.backgroundValues(viewPortPercent).hex()
