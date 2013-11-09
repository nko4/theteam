require ['jquery', 'lodash', 'crafty'], ($, _, C) ->
  C.c "Breathe",
    _inhale: ->
      @trigger 'inhale'
    _exhale: ->
      @trigger 'exhale'

    init: ->
      @bind 'KeyDown', (e) =>
        @_inhale() if e.key is C.keys['SPACE']
      @bind 'KeyUp', (e) ->
        @_exhale() if e.key is C.keys['SPACE']
