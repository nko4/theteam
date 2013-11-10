require ['crafty'], (C) ->

  _center = (component) ->
    C.viewport.width / 2 - component.w / 2

  _bottom = (component) ->
    C.viewport.height - component.h

  C.scene "main", ->
    C.generateWorld()

    padding = 10

    balloon = C.e("Balloon")
    balloon.attr x: _center(balloon), y: (C.viewport.height - balloon.h - padding)

    face = C.e("Face")
    face.attr x: _center(balloon) + 18, y: (C.viewport.height - balloon.h - padding + face.h)

    balloon.attach face

    NKO.balloon = balloon

    # Show Hud
    NKO.hud = new NKO.Views.Hud
    $("#hud").html NKO.hud.render().el
