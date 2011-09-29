      (function ($) {
        $.fn.fadeTransition = function(options) {
          var options = $.extend({pauseTime: 40000, transitionTime: 20000}, options);
          var transitionObject;

          Trans = function(obj) {
            var timer = null;
            var current = 0;
            var els = $("> *", obj).css("display", "none").css("left", "0").css("top", "0").css("position", "absolute");
            $(obj).css("position", "relative");
            $(els[current]).css("display", "block");

            function transition(next) {
              $(els[current]).fadeOut(options.transitionTime);
              $(els[next]).fadeIn(options.transitionTime);
              current = next;
              cue();
            };

            function cue() {
              if ($("> *", obj).length < 2) return false;
              if (timer) clearTimeout(timer);
              //timer = setTimeout(function() { transition((current + 1) % els.length | 0)} , options.pauseTime);
			  timer = setTimeout(function() { transition((current + 1) % els.length | 0)} , 5000);
            };
            
            this.showItem = function(item) {
              if (timer) clearTimeout(timer);
              transition(item);
            };

            cue();
          }

          this.showItem = function(item) {
            transitionObject.showItem(item);
          };

          return this.each(function() {
            transitionObject = new Trans(this);
          });
        }

      })(jQuery);
    
      var page = {
        tr: null,
        init: function() {
          page.tr = $(".hotnews").fadeTransition({pauseTime: 3000, transitionTime: 2000});
          $("div.navigation").each(function() {
            $(this).children().each( function(idx) {
              if ($(this).is("a"))
                $(this).click(function() { page.tr.showItem(idx); })
            });
          });
        },

        show: function(idx) {
          if (page.tr.timer) clearTimeout(page.tr.timer);
          page.tr.showItem(idx);
        }
      };

      $(document).ready(page.init);   