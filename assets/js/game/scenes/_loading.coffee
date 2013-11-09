require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.scene "loading", ->
    # this is to fix the caching issue for dom nodes
    # using a http source makes the browser not reload
    # TODO move to S3
    C.load ["https://i.cloudup.com/LD7P27BN1n-3000x3000.png", "https://i.cloudup.com/rLu9JKmVWf-3000x3000.png"], ->
      C.sprite 272, 383, "https://i.cloudup.com/LD7P27BN1n-3000x3000.png",
        mid_b:  [0,0]


      C.sprite 225, 76, "https://i.cloudup.com/rLu9JKmVWf-3000x3000.png",
        face_hit:     [0,0]
        face_normal:  [1,0]
        face_inhale:  [2,0]
        face_exhale:  [3,0]

      C.scene "main"
