require ['jquery', 'lodash', 'crafty'], ($, _, C) ->
  C.c 'Fly',
    _down: {}

    _reflection: -0.75
    _acceleration: 0.15
    _deceleration: 0.05

    _maxSpeed: 5
    _currentSpeed: 0
    _remainder: 0

    _leftEdge: ->
      0

    _rightEdge: ->
      C.viewport.width - @w

    _movingLeft: ->
      @_down['LEFT_ARROW']

    _movingRight: ->
      @_down['RIGHT_ARROW']

    _stopped: ->
      @_down['LEFT_ARROW'] and @_down['RIGHT_ARROW'] or
        not (@_down['LEFT_ARROW'] or @_down['RIGHT_ARROW'])

    _delta: (direction, rate) ->
      if direction is '+'
        dx = rate + @_remainder
        @_remainder = (@x + dx) % 1
      else if direction is '-'
        dx = rate - @_remainder
        @_remainder = 1 - ((@x + dx) % 1)
      else
        console.log direction

      ~~dx

    _bounce: ->
      @_currentSpeed = @_currentSpeed * @_reflection

    init: ->
      @requires 'Keyboard'
      @bind 'EnterFrame', (e) ->
        dx = if @_stopped()
          if @_currentSpeed < 0
            @_delta('+', @_currentSpeed += @_deceleration)
          else if @_currentSpeed > 0
            @_delta('-', @_currentSpeed -= @_deceleration)
        else if @_movingLeft()
          if @_currentSpeed > -@_maxSpeed
            @_delta('-', @_currentSpeed -= @_acceleration)
          else
            @_remainder = 0
            -@_maxSpeed
        else if @_movingRight()
          if @_currentSpeed < @_maxSpeed
            @_delta('+', @_currentSpeed += @_acceleration)
          else
            @_remainder = 0
            @_maxSpeed

        if dx
          if @x + dx < @_leftEdge()
            @_bounce()
            @x = @_leftEdge()
          else if @x + dx > @_rightEdge()
            @_bounce()
            @x = @_rightEdge()
          else
            @x += dx

      @bind 'KeyUp', ->
        if not @isDown('LEFT_ARROW') and @_down['LEFT_ARROW']
          console.log 'LEFT_ARROW UP'
          @_down['LEFT_ARROW'] = false
        if not @isDown('RIGHT_ARROW') and @_down['RIGHT_ARROW']
          console.log 'RIGHT_ARROW UP'
          @_down['RIGHT_ARROW'] = false
      @bind 'KeyDown', ->
        if @isDown('LEFT_ARROW') and not @_down['LEFT_ARROW']
          console.log 'LEFT_ARROW DOWN'
          @_down['LEFT_ARROW'] = true
        if @isDown('RIGHT_ARROW') and not @_down['RIGHT_ARROW']
          console.log 'RIGHT_ARROW DOWN'
          @_down['RIGHT_ARROW'] = true
