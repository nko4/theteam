require ['crafty'], (C) ->

  C.c "Face",
    init: ->
      @requires '2D, DOM, face_normal'
      @attr w: 112, h: 38

      @bind 'EnterFrame', =>
        @unbind 'EnterFrame'

        @parent.bind 'exhaleComplete', =>
          @sprite(1, 0)

        @parent.bind 'inhale', =>
          @sprite(2, 0)

        @parent.bind 'exhale', =>
          @sprite(3, 0)

