require ['jquery', 'lodash', 'crafty'], ($, _, C) ->
  C.c 'Fly',
    _down: {}

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
      @requires 'Keyboard'
      @bind 'EnterFrame', (e) ->
        if @_stopped()
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

          if @_movingLeft()
            if @_currentSpeed > -@_maxSpeed
              dx = @_delta('-', @_currentSpeed -= @_acceleration)
            else
              @_remainder = 0
              dx = -@_maxSpeed
          else if @_movingRight()
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

      @bind 'KeyUp', ->
        if not @isDown('LEFT_ARROW') and @_down['LEFT_ARROW']
          @_down['LEFT_ARROW'] = false
        if not @isDown('RIGHT_ARROW') and @_down['RIGHT_ARROW']
          @_down['RIGHT_ARROW'] = false
      @bind 'KeyDown', ->
        if @isDown('LEFT_ARROW') and not @_down['LEFT_ARROW']
          @_down['LEFT_ARROW'] = true
        if @isDown('RIGHT_ARROW') and not @_down['RIGHT_ARROW']
          @_down['RIGHT_ARROW'] = true
