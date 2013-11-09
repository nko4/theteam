require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.c "Balloon",
    init: ->
      @requires '2D, DOM, Color, Twoway, Float, Breathe, mid_b'
      @attr w: 136, h: 190
      @twoway 4, 0

  C.c "Breathe",
    _inhale: ->
    _exhale: ->

    init: ->
      @requires 'Keyboard'
      @bind 'KeyUp', (e) ->
        unless @isDown('SPACE')
          console.log 'SPACE up'
      @bind 'KeyDown', (e) ->
        if @isDown('SPACE')
          console.log 'SPACE down'

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
