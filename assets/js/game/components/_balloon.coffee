require ['jquery', 'lodash', 'crafty'], ($, _, C) ->
  C.c "Balloon",
    init: ->
      @requires 'Actor, SpriteAnimation, Fly, Float, Breathe, balloon_4'
      @attr w: 136, h: 190
      @bind 'inhale', @inhale
      @bind 'exhale', @exhale
      @bind 'AnimationEnd', (o) =>
        @trigger 'exhaleComplete' if o.reelId is "exhale"

    inhale: ->
      @animate('inhale', 4, 0, 7)
      @playAnimation 'inhale', 20, 0

    exhale: ->
      @animate('exhale', 7, 0, 4)
      @playAnimation 'exhale', 40, 0
