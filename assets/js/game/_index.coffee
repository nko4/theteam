#= require "_init"
#= require "scenes/_loading"
#= require "scenes/_main"
#= require "components/_actor"
#= require "components/_face"
#= require "components/_balloon"
#= require "components/_cloud"

require ['jquery', 'lodash', 'crafty'], ($, _, C) ->

  C.scene "loading"
