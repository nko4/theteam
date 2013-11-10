require ['crafty'], (C) ->

  NKO.viewport  = {height: 6000, width: 800}
  NKO.gameState = {}
  NKO.numberOfClouds = 80

  window.C = C

  C.init 800, 600, $('.game')[0]
  C.viewport.clampToEntities = false
  C.backgroundValues = chroma.scale(["#59C6D9", "#257A8B", "#104B5B"])
  C.background C.backgroundValues(0).hex()

  C.generateWorld = ->
    # Seed Math.Random for consistent level design
    seed = if NKO.gameState.replay
      NKO.gameState.seed
    else
      NKO.gameState.seed = _.sample ["word", "reptile", "dweller", "quality", "glacier", "interview", "foam", "ghost", "cost", "quantity", "magnitude", "dust", "damsel", "sky", "bowl", "ritual", "gymnastics", "salute", "retailer", "bottle", "fabric", "onslaught", "dummy", "panic", "molecule", "brute", "daffodil", "nun", "thistledown", "barrel", "world", "shotgun", "master", "casement", "pep", "feline", "shoes", "instance", "forehead", "opium", "corner", "butterfly", "costume", "slipper", "golf", "tragedy", "banner", "deluge", "instrument", "temple", "edition", "fantasy", "namesake", "gist", "sauce", "leggings", "clock", "outcome", "thicket", "pianist", "array", "hall", "amount", "banker", "item", "wench", "captive", "theory", "gore", "profession", "ensemble", "camp", "blacksmith", "candidate", "offshoot", "simile", "sultan", "gadfly", "volcano", "revolver", "glory", "gallery", "lawn", "abdomen", "builder", "industry", "lad", "profile", "happiness", "chance", "abyss", "gaiety", "nectar", "joke", "joy", "hospital", "deceit", "gold", "essence", "beast", "lemonade"]

    Math.seedrandom seed
    NKO.seededNumbers = _.times NKO.numberOfClouds, Math.random

    # Draw our game board clouds here
    spawner = C.e("Spawner")
    spawner.spawnElement(num) for num in [1..NKO.numberOfClouds]
