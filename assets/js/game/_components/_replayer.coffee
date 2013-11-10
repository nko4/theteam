require ['crafty'], (C) ->

  _firstFrame = null

  C.c 'Replayer',
    _keyStates: {}
    _keyEvents: {}

    _replay: (keyEvents) ->
      @_keyEvents = _.clone(keyEvents)

    init: ->
      @bind 'EnterFrame', (e) ->
        _firstFrame = e.frame unless _firstFrame?
        virtualFrame = e.frame - _firstFrame

        if @_keyEvents[virtualFrame]
          _.extend @_keyStates, @_keyEvents[virtualFrame]

          # maybe this should fire events for the next frame instead
          for k, s of @_keyEvents[virtualFrame]
            if s
              @trigger 'KeyDown', key: parseInt(k)
            else
              @trigger 'KeyUp', key: parseInt(k)
