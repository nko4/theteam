#= require "_init"
#= require "../vendor/chroma"
#= require "scenes/_loading"
#= require "scenes/_main"
#= require "_components/_actor"
#= require "_components/_spawner"
#= require "_components/_face"
#= require "_components/_fly"
#= require "_components/_float"
#= require "_components/_breathe"
#= require "_components/_balloon"
#= require "_components/_cloud"

require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.scene "loading"
