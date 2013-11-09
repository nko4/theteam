(function() {
  require(['jquery', 'lodash', 'crafty'], function($, _, C) {
    window.C = C;
    C.init(500, 350, $('.game')[0]);
    C.viewport.clampToEntities = false;
    return C.background('#aaaaaa');
  });

}).call(this);

(function() {
  require(['jquery', 'lodash', 'crafty'], function($, _, C) {
    return C.e('2D, DOM, Color, Twoway').attr({
      x: 0,
      y: 0,
      w: 100,
      h: 100
    }).color('#F00').twoway('5');
  });

}).call(this);

(function() {
  require(['jquery', 'lodash', 'crafty'], function($, _, C) {
    return C.c("Cloud", {
      init: function() {
        this.requires('2D, DOM, Color');
        return this.bind;
      }
    });
  });

}).call(this);

(function() {


}).call(this);

(function() {
  require.config({
    paths: {
      jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min',
      lodash: '//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.2.1/lodash.min',
      crafty: '//cdnjs.cloudflare.com/ajax/libs/crafty/0.5.3/crafty-min'
    }
  });

}).call(this);
