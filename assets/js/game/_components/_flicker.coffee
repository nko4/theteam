require ['crafty'], (C) ->

  C.c "Flicker",
    flickering: true
    init: ->
      @flicker = true
      @bind "EnterFrame", (e) ->
        if e.frame % 5 is 0 and @flickering
          @alpha = if @alpha is 0.0 then 1.0 else 0.0

        if not @flickering
          @alpha = 1.0
