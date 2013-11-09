require(['crafty'], function(Crafty) {
  Crafty.viewport.followX = (function() {
      var oldTarget, offx, offy;

      function change() {
          // Crafty.viewport.scroll('_x', -(this.x + (this.w / 2) - (Crafty.viewport.width / 2) - offx));
          Crafty.viewport.scroll('_y', -(this.y + (this.h / 2) - (Crafty.viewport.height / 2) - offy));
          Crafty.viewport._clamp();
      }

      return function (target, offsetx, offsety) {
          if (oldTarget)
              oldTarget.unbind('Change', change);
          if (!target || !target.has('2D'))
              return;
          Crafty.viewport.pan('reset');

          oldTarget = target;
          offx = (typeof offsetx != 'undefined') ? offsetx : 0;
          offy = (typeof offsety != 'undefined') ? offsety : 0;

          target.bind('Change', change);
          change.call(target);
      }
  })();
});
