require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  _center = (component) ->
    C.viewport.width / 2 - component.w / 2

  _bottom = (component) ->
    C.viewport.height - component.h

  C.scene "main", ->

    balloon = C.e("Balloon")
    balloon.attr x: _center(balloon), y: _bottom(balloon)

    C.e("Cloud")
