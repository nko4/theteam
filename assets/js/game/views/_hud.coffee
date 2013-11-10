class NKO.Views.Hud extends Backbone.View
  template: window.templates.hud_layout
  className: 'hud-layout'

  initialize: ->
    @indicatorHeight = 530
    @viewportHieght = NKO.viewport.height

  updateAltitude: (alt) ->
    @$('.dot').css 'bottom': "#{@_convertToSidebar(alt)}px"
    @$('.mileage').text "#{@_convertToEarthMiles(alt)}mi"

  addHeart: ->
    $emptyHeart = @$(".heart.empty").last()
    unless _.isEmpty($emptyHeart)
      $emptyHeart.removeClass('empty').addClass('full')

  removeHeart: ->
    $fullHearts = @$(".heart.full")
    $fullHearts.first().removeClass('full').addClass('empty')

    if $fullHearts.length is 1
      NKO.balloon.trigger("hearts:empty")

  startTimer: ->
    start = new Date
    setInterval =>
      @lastTimeNumber = Math.round((new Date - start) / 1000)
      @$('.time').text @_toHHMMSS(@lastTimeNumber)
    , 1000

  onRender: ->
    @startTimer()

  render: ->
    @$el.html @template()
    @onRender()
    this

  getScore: -> @lastScore

  getTime: -> @lastTime

  getSpeedTime: -> @lastTimeNumber

  _toHHMMSS: (int) ->
    num     = parseInt(int, 10)
    hours   = Math.floor(num/3600)
    minutes = Math.floor((num - (hours*3600)) / 60)
    seconds = num - (hours*3600) - (minutes*60)

    if (minutes < 10) then minutes = "0#{minutes}"
    if (seconds < 10) then seconds = "0#{seconds}"

    @lastTime = "#{minutes}:#{seconds}"
    @lastTime

  _convertToSidebar: (num) ->
    Math.max 10, (num+450) * (520/6450) + 10

  _convertToEarthMiles: (num) ->
    @lastScore = Math.max 0, Math.round( (num+450) * (225000/6450) )
    @lastScore
