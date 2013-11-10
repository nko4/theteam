#= require "crafty-custom-follow"
#= require "_init"
#= require "_database"
#= require "../vendor/chroma"
#= require "models/_player"
#= require "views/_hud"
#= require "scenes/_end"
#= require "scenes/_loading"
#= require "scenes/_main"
#= require "_components/_actor"
#= require "_components/_spawner"
#= require "_components/_face"
#= require "_components/_fly"
#= require "_components/_float"
#= require "_components/_breathe"
#= require "_components/_flicker"
#= require "_components/_balloon"
#= require "_components/_cloud"
#= require "_components/_recorder"
#= require "_components/_replayer"

require ['crafty'], (C) ->
  C.scene "loading"
