require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  window.C = C

  C.init 1024, 768, $('.game')[0]

  C.viewport.clampToEntities = false

  C.background '#aaaaaa'
