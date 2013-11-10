NKO.Game.Components.push (C) ->

  C.c 'Fly',
    _reflection: -0.75
    _acceleration: 0.15
    _deceleration: 0.05

    _maxRotation: 15
    _currentRotation: 0
    _apex: 0
    _step: 0

    _maxSpeed: 5
    _currentSpeed: 0
    _remainder: 0

    _isDown: (key) ->
      @_keyStates[C.keys[key]]

    _leftEdge: ->
      0

    _rightEdge: ->
      C.viewport.width - @w

    _movingLeft: (frame) -> @_isDown('LEFT_ARROW', frame)
    _movingRight: (frame) -> @_isDown('RIGHT_ARROW', frame)

    _stopped: (frame) ->
      @_isDown('LEFT_ARROW', frame) and @_isDown('RIGHT_ARROW', frame) or
        not (@_isDown('LEFT_ARROW', frame) or @_isDown('RIGHT_ARROW', frame))

    _delta: (direction, rate) ->
      if direction is '+'
        dx = rate + @_remainder
        @_remainder = (@x + dx) % 1
      else if direction is '-'
        dx = rate - @_remainder
        @_remainder = 1 - ((@x + dx) % 1)

      ~~dx

    _bounce: ->
      @_currentSpeed = @_currentSpeed * @_reflection

    _rotateTo: (angle) ->
      @_rotating = true
      @_fromAngle = @_currentRotation
      @_toAngle   = angle
      @_apex = angle
      @_step = 0.2

    init: ->
      @bind 'EnterFrame', (e) ->
        if @_stopped(e.frame)
          if @_moving
            @_moving = false
            @_rotateTo(@_currentRotation * -0.5)

          if @_currentSpeed < 0
            dx = @_delta('+', @_currentSpeed += @_deceleration)
          else if @_currentSpeed > 0
            dx = @_delta('-', @_currentSpeed -= @_deceleration)

          unless @_rotating
            targetRotation = @_currentRotation * -0.5
            unless targetRotation < 1 and targetRotation > -1
              @_rotateTo targetRotation

        else
          unless @_moving
            @_moving   = true
            @_swinging = true
            @_rotateTo (@_currentSpeed / @_maxSpeed * @_maxRotation) * -1

          if @_movingLeft(e.frame)
            if @_currentSpeed > -@_maxSpeed
              dx = @_delta('-', @_currentSpeed -= @_acceleration)
            else
              @_remainder = 0
              dx = -@_maxSpeed
          else if @_movingRight(e.frame)
            if @_currentSpeed < @_maxSpeed
              dx = @_delta('+', @_currentSpeed += @_acceleration)
            else
              @_remainder = 0
              dx = @_maxSpeed

          unless @_rotating
            @_swinging = false

          unless @_swinging
            @_rotateTo ~~(@_currentSpeed / @_maxSpeed * @_maxRotation)

        if @_rotating
           scale = Math.abs(Math.abs(@_currentRotation) - Math.abs(@_apex)) / Math.abs(@_apex)
           step  = if scale < 0.25 then @_step else @_step * 2

          if @_currentRotation < ~~@_apex and @_apex > 0
            @rotation = @_currentRotation += step
          else if @_currentRotation > Math.ceil(@_apex) and @_apex < 0
            @rotation = @_currentRotation -= step
          else
            @_rotating = false

        if dx
          if @x + dx < @_leftEdge()
            @_bounce()
            @x = @_leftEdge()
          else if @x + dx > @_rightEdge()
            @_bounce()
            @x = @_rightEdge()
          else
            @x += dx
