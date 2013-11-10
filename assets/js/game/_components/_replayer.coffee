require ['crafty'], (C) ->

  C.c 'Replayer',
    _keyStates: {}
    _keyEvents: {}

    _replay: (keyEvents) ->
      @_keyEvents = keyEvents

    init: ->
      @bind 'EnterFrame', (e) ->
        if @_keyEvents[e.frame]
          _.extend @_keyStates, @_keyEvents[e.frame]

          # maybe this should fire events for the next frame instead
          for k, s of @_keyEvents[e.frame]
            if s
              @trigger 'KeyDown', key: parseInt(k)
            else
              @trigger 'KeyUp', key: parseInt(k)
