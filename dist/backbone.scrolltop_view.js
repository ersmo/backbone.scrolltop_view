(function() {
  var _ref,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Backbone.ScrollTopView = (function(_super) {
    __extends(ScrollTopView, _super);

    function ScrollTopView() {
      this.onScroll = __bind(this.onScroll, this);
      this.scrollTop = __bind(this.scrollTop, this);
      this.render = __bind(this.render, this);
      _ref = ScrollTopView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ScrollTopView.prototype.tagName = 'a';

    ScrollTopView.prototype.id = 'scroll-top';

    ScrollTopView.prototype.defaults = {
      bottom: '15px',
      right: '15px'
    };

    ScrollTopView.prototype.events = {
      'click': 'scrollTop'
    };

    ScrollTopView.prototype.initialize = function() {
      this.options = _.defaults(this.options, this.defaults);
      this.$el.css('bottom', this.options.bottom);
      this.$el.css('right', this.options.right);
      this.$body = $('body, html');
      return this.onScroll();
    };

    ScrollTopView.prototype.render = function() {
      return this;
    };

    ScrollTopView.prototype.scrollTop = function(e) {
      e.preventDefault();
      this.$body.animate({
        scrollTop: 0
      }, 'fast');
      return false;
    };

    ScrollTopView.prototype.onScroll = function() {
      var $doc, added,
        _this = this;
      $doc = $(document);
      added = false;
      return $doc.scroll(function(e) {
        if ($doc.scrollTop() > 5) {
          if (added) {
            return;
          }
          added = true;
          return _this.$body.addClass('scroll');
        } else {
          added = false;
          return _this.$body.removeClass('scroll');
        }
      });
    };

    return ScrollTopView;

  })(Backbone.View);

}).call(this);
