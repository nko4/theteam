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
      @lastTime = NKO.toHHMMSS(@lastTimeNumber)
      @$('.time').text @lastTime
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

  _convertToSidebar: (num) ->
    Math.max 10, (num+450) * (520/6450) + 10

  _convertToEarthMiles: (num) ->
    @lastScore = Math.max 0, Math.round( (num+450) * (225000/6450) )
    @lastScore
