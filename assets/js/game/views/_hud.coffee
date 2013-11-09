class NKO.Views.Hud extends Backbone.View
  template: window.templates.hud_layout
  className: 'hud-layout'

  startTimer: ->
    start = new Date
    setInterval =>
      @$('.time').text @_toHHMMSS(Math.round((new Date - start) / 1000))
    , 1000

  onRender: ->
    @startTimer()

  render: ->
    @$el.html @template()
    @onRender()
    this

  _toHHMMSS: (int) ->
    num     = parseInt(int, 10)
    hours   = Math.floor(num/3600)
    minutes = Math.floor((num - (hours*3600)) / 60)
    seconds = num - (hours*3600) - (minutes*60)

    if (minutes < 10) then minutes = "0#{minutes}"
    if (seconds < 10) then seconds = "0#{seconds}"

    "#{minutes}:#{seconds}"
