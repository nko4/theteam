require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.scene "loading", ->
    # load audio and sprites here

    # this is to fix the caching issue for dom nodes
    # using a http source makes the browser not reload
    # TODO move to S3
    C.load [
      "https://i.cloudup.com/gyH0JZzyBS-3000x3000.png",
      "https://i.cloudup.com/rLu9JKmVWf-3000x3000.png"
      "img/clouds-white.png"
      "img/clouds-blue.png"
      "img/stars.png"
    ], ->
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

      C.sprite 366, 252, "img/clouds-white.png", {
        w1: [0,0]
        w2: [1,0]
        w3: [2,0]
        w4: [3,0]
        w5: [4,0]
        w6: [5,0]
        w7: [6,0]
        w8: [7,0]
      }

      C.sprite 366, 252, "img/clouds-blue.png", {
        b1: [0,0]
        b2: [1,0]
        b3: [2,0]
        b4: [3,0]
        b5: [4,0]
        b6: [5,0]
        b7: [6,0]
        b8: [7,0]
      }

      C.sprite 148, "img/stars.png", {
        s1:  [0,0]
        s2:  [1,0]
        s3:  [2,0]
        s4:  [3,0]
        s5:  [4,0]
        s6:  [5,0]
        s7:  [6,0]
        s8:  [7,0]
        s9:  [8,0]
        s10: [9,0]
      }

      C.scene "main"
