require ['crafty'], (C) ->

  C.c 'Recorder',
    _keyStates: {}
    _keyEvents: {}
    _keyEventsThisTick: {}

    _save: ->
      @_keyEvents

    init: ->
      @requires 'Keyboard'

      @bind 'KeyUp', (e) ->
        if e.key of @_keyStates
          @_keyStates[e.key]         = false
          @_keyEventsThisTick[e.key] = false

      @bind 'KeyDown', (e) ->
        @_keyStates[e.key]         = true
        @_keyEventsThisTick[e.key] = true

      @bind 'EnterFrame', (e) ->
        unless _.isEmpty(@_keyEventsThisTick)
          @_keyEvents[e.frame] = @_keyEventsThisTick

        @_keyEventsThisTick  = {}
