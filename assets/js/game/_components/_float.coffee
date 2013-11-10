NKO.Game.Components.push (C) ->

  C.c "Float",
    _dy: 0
    _direction: 'up'

    init: ->
      @bind 'EnterFrame', (e) ->
        if e.frame % 4 is 0
          if @_direction is 'up'
            if @_dy < 10
              if @_dy < -5
                @_dy += 1
                @y += 1
              else if @_dy < 5
                @_dy += 2
                @y += 2
              else
                @_dy += 1
                @y += 1
            else
              @_direction = 'down'
          else
            if @_dy > -10
              if @_dy > 5
                @_dy -= 1
                @y -=1
              else if @_dy > -6
                @_dy -=2
                @y -=2
              else
                @_dy -= 1
                @y -=1
            else
              @_direction = 'up'
