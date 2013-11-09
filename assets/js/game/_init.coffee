require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  # Seed Math.Random for consistent level design
  seedList = ["word", "reptile", "dweller", "quality", "glacier", "interview", "foam", "ghost", "cost", "quantity", "magnitude", "dust", "damsel", "sky", "bowl", "ritual", "gymnastics", "salute", "retailer", "bottle", "fabric", "onslaught", "dummy", "panic", "molecule", "brute", "daffodil", "nun", "thistledown", "barrel", "world", "shotgun", "master", "casement", "pep", "feline", "shoes", "instance", "forehead", "opium", "corner", "butterfly", "costume", "slipper", "golf", "tragedy", "banner", "deluge", "instrument", "temple", "edition", "fantasy", "namesake", "gist", "sauce", "leggings", "clock", "outcome", "thicket", "pianist", "array", "hall", "amount", "banker", "item", "wench", "captive", "theory", "gore", "profession", "ensemble", "camp", "blacksmith", "candidate", "offshoot", "simile", "sultan", "gadfly", "volcano", "revolver", "glory", "gallery", "lawn", "abdomen", "builder", "industry", "lad", "profile", "happiness", "chance", "abyss", "gaiety", "nectar", "joke", "joy", "hospital", "deceit", "gold", "essence", "beast", "lemonade"]
  Math.seedrandom _.sample(seedList)

  window.C = C

  C.init 800, 600, $('.game')[0]
  C.viewport.clampToEntities = false
  C.background '#aaaaaa'

  C.generateWorld = ->
    # Draw our game board clouds here
    spawner = C.e("Spawner")

    spawner.spawnElement(num) for num in [1..100]
