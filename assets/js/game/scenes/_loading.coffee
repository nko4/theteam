require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.scene "loading", ->
    # this is to fix the caching issue for dom nodes
    # using a http source makes the browser not reload
    # TODO move to S3
    C.load ["https://i.cloudup.com/gyH0JZzyBS-3000x3000.png", "https://i.cloudup.com/rLu9JKmVWf-3000x3000.png"], ->
      C.sprite 320, 378, "https://i.cloudup.com/gyH0JZzyBS-3000x3000.png",
        balloon_0: [0, 0]
        balloon_1: [1, 0]
        balloon_2: [2, 0]
        balloon_3: [3, 0]
        balloon_4: [4, 0]
        balloon_5: [5, 0]
        balloon_6: [6, 0]
        balloon_7: [7, 0]


      C.sprite 225, 76, "https://i.cloudup.com/rLu9JKmVWf-3000x3000.png",
        face_hit:     [0,0]
        face_normal:  [1,0]
        face_inhale:  [2,0]
        face_exhale:  [3,0]

      C.scene "main"
