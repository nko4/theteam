require ['goinstant', 'uuid'], ->
  class NKO.Database
    GOINSTANT_URL = 'https://goinstant.net/Zoom/Zoom'

    connect: (callback) ->
      if @connection
        callback.call(@)
      else
        goinstant.connect GOINSTANT_URL, (error, connection, lobby) =>
          @lobby      = lobby
          @connection = connection
          callback.call(@, error)

    watch: (key, callback) ->
      @lobby.key(key).on 'set', bubble: true, (value) ->
        callback(null, value)

      @get key, (error, value) ->
        callback(error, value)

    get: (key, callback) ->
      @lobby.key(key).get(callback)

    set: (key, value, callback) ->
      @lobby.key(key).set(value, callback)

    remove: (key, callback) ->
      @lobby.key(key).remove(callback)

  NKO.database = new NKO.Database

  # NKO.database.connect ->
    #
    # highScores:
    #   <UUID>:
    #     score: <Number>
    #     name: <String>
    #     state: <UUID>
    # gameStates:
    #   <UUID>: [STATE]
    #

    # console.log UUID()

    # highScores = {}
    # highScores[UUID()] =
    #   score: 2000
    #   name: 'Bob Smith'
    #   state: UUID()

    # highScores[UUID()] =
    #   score: 12000
    #   name: 'Tom Jones'
    #   state: UUID()

    # @set 'highScores', highScores

        # balloon._replay
    #   5:
    #     32: 1
    #     37: 1
    #   100:
    #     37: 0
    #     39: 1
    #   200:
    #     37: 1
    #     39: 0
    #   300:
    #     32: 0

    # @set 'gameStates',
    #   "8092ad4d-0a82-446b-b2c0-0c4ccb2298ad":
    #     5:
    #       32: 1
    #       37: 1
    #     100:
    #       37: 0
    #       39: 1
    #     200:
    #       37: 1
    #       39: 0
    #     300:
    #       32: 0

    # @get 'highScores', (error, highScores) ->
    #   console.log _(highScores).values().sort('score').first(1).value()

    # @get 'gameStates', (error, gameStates) ->
    #   console.log gameStates

  # getHighScores
  # # read high scores key, sort by score, take the top 10, keep it updated over course of game

  # isHighScore
  # # score is higher than one in the high score list

  # submitHighScore
  # # insert into high score list and delete the lowest, also issue a delete to keep list at 100 long
