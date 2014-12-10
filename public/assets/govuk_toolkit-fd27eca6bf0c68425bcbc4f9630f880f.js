(function() {
  "use strict";
  window.GOVUK = window.GOVUK || {};
  var $ = window.$;

  // A multivariate test framework
  //
  // Based loosely on https://github.com/jamesyu/cohorts
  //
  // Full documentation is in README.md.
  //
  function MultivariateTest(options) {
    this.$el = $(options.el);
    this._loadOption(options, 'name');
    this._loadOption(options, 'customVarIndex');
    this._loadOption(options, 'cohorts');
    this._loadOption(options, 'runImmediately', true);
    this._loadOption(options, 'defaultWeight', 1);

    if (this.runImmediately) {
      this.run();
    }
  }

  MultivariateTest.prototype._loadOption = function(options, key, defaultValue) {
    if (options[key] !== undefined) {
      this[key] = options[key];
    }
    if (this[key] === undefined) {
      if (defaultValue === undefined) {
        throw new Error(key+" option is required for a multivariate test");
      }
      else {
        this[key] = defaultValue;
      }
    }
  };

  MultivariateTest.prototype.run = function() {
    var cohort = this.getCohort();
    if (cohort) {
      this.setCustomVar(cohort);
      this.executeCohort(cohort);
    }
  };

  MultivariateTest.prototype.executeCohort = function(cohort) {
    var cohortObj = this.cohorts[cohort];
    if (cohortObj.callback) {
      if (typeof cohortObj.callback === "string") {
        this[cohortObj.callback]();
      }
      else {
        cohortObj.callback();
      }
    }
    if (cohortObj.html) {
      this.$el.html(cohortObj.html);
      this.$el.show();
    }
  };

  // Get the current cohort or assign one if it has not been already
  MultivariateTest.prototype.getCohort = function() {
    var cohort = GOVUK.cookie(this.cookieName());
    if (!cohort || !this.cohorts[cohort]) {
      cohort = this.chooseRandomCohort();
      GOVUK.cookie(this.cookieName(), cohort, {days: 30});
    }
    return cohort;
  };

  MultivariateTest.prototype.setCustomVar = function(cohort) {
    window._gaq = window._gaq || [];
    window._gaq.push([
      '_setCustomVar',
      this.customVarIndex,
      this.cookieName(),
      cohort,
      2 // session level
    ]);
    // Fire off a dummy event to set the custom var on the page.
    // Ideally we'd be able to call setCustomVar before trackPageview,
    // but would need reordering the existing GA code.
    window._gaq.push(['_trackEvent', this.cookieName(), 'run', '-', 0, true]);
  };

  MultivariateTest.prototype.weightedCohortNames = function() {
    var names = [],
        defaultWeight = this.defaultWeight;

    $.each(this.cohorts, function(key, cohortSettings) {
      var numberForCohort, i;

      if (typeof cohortSettings.weight === 'undefined'){
        numberForCohort = defaultWeight;
      } else {
        numberForCohort = cohortSettings.weight;
      }

      for(i=0; i<numberForCohort; i++){
        names.push(key);
      }
    });

    return names;
  };

  MultivariateTest.prototype.chooseRandomCohort = function() {
    var names = this.weightedCohortNames();
    return names[Math.floor(Math.random() * names.length)];
  };

  MultivariateTest.prototype.cookieName = function() {
    return "multivariatetest_cohort_" + this.name;
  };

  window.GOVUK.MultivariateTest = MultivariateTest;
}());
(function() {
  "use strict";
  window.GOVUK = window.GOVUK || {};

  // Only show the first {n} items in a list, documentation is in the README.md
  var PrimaryList = function(el, selector){
    this.$el = $(el);
    this.$extraLinks = this.$el.find('li:not('+selector+')');
    // only hide more than one extra link
    if(this.$extraLinks.length > 1){
      this.addToggleLink();
      this.hideExtraLinks();
    }
  };
  PrimaryList.prototype = {
    toggleText: function(){
      if(this.$extraLinks.length > 1){
        return '+'+ this.$extraLinks.length +' others';
      } else {
        return '+'+ this.$extraLinks.length +' other';
      }
    },
    addToggleLink: function(){
      this.$toggleLink = $('<a href="#">'+ this.toggleText() + '</a>');
      this.$toggleLink.click($.proxy(this.toggleLinks, this));
      this.$toggleLink.insertAfter(this.$el);
    },
    toggleLinks: function(e){
      e.preventDefault();
      this.$toggleLink.remove();
      this.showExtraLinks();
    },
    hideExtraLinks: function(){
      this.$extraLinks.addClass('visuallyhidden');
      $(window).trigger('govuk.pageSizeChanged');
    },
    showExtraLinks: function(){
      this.$extraLinks.removeClass('visuallyhidden');
      $(window).trigger('govuk.pageSizeChanged');
    }
  };
  GOVUK.PrimaryList = PrimaryList;

  GOVUK.primaryLinks = {
    init: function(selector){
      $(selector).parent().each(function(i, el){
        new GOVUK.PrimaryList(el, selector);
      });
    }
  };
}());
(function () {
  "use strict";
  var root = this,
      $ = root.jQuery;

  if (typeof GOVUK === 'undefined') { root.GOVUK = {}; }

  var SelectionButtons = function (elmsOrSelector, opts) {
    var $elms;

    this.selectedClass = 'selected';
    this.focusedClass = 'focused';
    if (opts !== undefined) {
      $.each(opts, function (optionName, optionObj) {
        this[optionName] = optionObj;
      }.bind(this));
    }
    if (typeof elmsOrSelector === 'string') {
      $elms = $(elmsOrSelector);
      this.selector = elmsOrSelector;
      this.setInitialState($(this.selector));
    } else {
      this.$elms = elmsOrSelector;
      this.setInitialState(this.$elms);
    }
    this.addEvents();
  };
  SelectionButtons.prototype.addEvents = function () {
    if (typeof this.$elms !== 'undefined') {
      this.addElementLevelEvents();
    } else {
      this.addDocumentLevelEvents();
    }
  };
  SelectionButtons.prototype.setInitialState = function ($elms) {
    $elms.each(function (idx, elm) {
      var $elm = $(elm);

      if ($elm.is(':checked')) {
        this.markSelected($elm);
      }
    }.bind(this));
  };
  SelectionButtons.prototype.markFocused = function ($elm, state) {
    if (state === 'focused') {
      $elm.parent('label').addClass(this.focusedClass);
    } else {
      $elm.parent('label').removeClass(this.focusedClass);
    }
  };
  SelectionButtons.prototype.markSelected = function ($elm) {
    var radioName;

    if ($elm.attr('type') === 'radio') {
      radioName = $elm.attr('name');
      $($elm[0].form).find('input[name="' + radioName + '"]')
        .parent('label')
        .removeClass(this.selectedClass);
      $elm.parent('label').addClass(this.selectedClass);
    } else { // checkbox
      if ($elm.is(':checked')) {
        $elm.parent('label').addClass(this.selectedClass);
      } else {
        $elm.parent('label').removeClass(this.selectedClass);
      }
    }
  };
  SelectionButtons.prototype.addElementLevelEvents = function () {
    this.clickHandler = this.getClickHandler();
    this.focusHandler = this.getFocusHandler({ 'level' : 'element' });

    this.$elms
      .on('click', this.clickHandler)
      .on('focus blur', this.focusHandler);
  };
  SelectionButtons.prototype.addDocumentLevelEvents = function () {
    this.clickHandler = this.getClickHandler();
    this.focusHandler = this.getFocusHandler({ 'level' : 'document' });

    $(document)
      .on('click', this.selector, this.clickHandler)
      .on('focus blur', this.selector, this.focusHandler);
  };
  SelectionButtons.prototype.getClickHandler = function () {
    return function (e) {
      this.markSelected($(e.target));
    }.bind(this);
  };
  SelectionButtons.prototype.getFocusHandler = function (opts) {
    var focusEvent = (opts.level === 'document') ? 'focusin' : 'focus';

    return function (e) {
      var state = (e.type === focusEvent) ? 'focused' : 'blurred';

      this.markFocused($(e.target), state);
    }.bind(this);
  };
  SelectionButtons.prototype.destroy = function () {
    if (typeof this.selector !== 'undefined') {
      $(document)
        .off('click', this.selector, this.clickHandler)
        .off('focus blur', this.selector, this.focusHandler);
    } else {
      this.$elms
        .off('click', this.clickHandler)
        .off('focus blur', this.focusHandler);
    }
  };

  root.GOVUK.SelectionButtons = SelectionButtons;
}).call(this);
(function () {
  "use strict";
  var root = this,
      $ = root.jQuery;
  if(typeof root.GOVUK === 'undefined') { root.GOVUK = {}; }

  // Stick elements to top of screen when you scroll past, documentation is in the README.md
  var sticky = {
    _hasScrolled: false,
    _scrollTimeout: false,

    init: function(){
      var $els = $('.js-stick-at-top-when-scrolling');

      if($els.length > 0){
        sticky.$els = $els;

        if(sticky._scrollTimeout === false) {
          $(root).scroll(sticky.onScroll);
          sticky._scrollTimeout = root.setInterval(sticky.checkScroll, 50);
        }
        $(root).resize(sticky.onResize);
      }
      if(root.GOVUK.stopScrollingAtFooter){
        $els.each(function(i,el){
          var $img = $(el).find('img');
          if($img.length > 0){
            var image = new Image();
            image.onload = function(){
              root.GOVUK.stopScrollingAtFooter.addEl($(el), $(el).outerHeight());
            };
            image.src = $img.attr('src');
          } else {
            root.GOVUK.stopScrollingAtFooter.addEl($(el), $(el).outerHeight());
          }
        });
      }
    },
    onScroll: function(){
      sticky._hasScrolled = true;
    },
    checkScroll: function(){
      if(sticky._hasScrolled === true){
        sticky._hasScrolled = false;

        var windowVerticalPosition = $(root).scrollTop();
        sticky.$els.each(function(i, el){
          var $el = $(el),
              scrolledFrom = $el.data('scrolled-from');

          if (scrolledFrom && windowVerticalPosition < scrolledFrom){
            sticky.release($el);
          } else if($(root).width() > 768 && windowVerticalPosition >= $el.offset().top) {
            sticky.stick($el);
          }
        });
      }
    },
    stick: function($el){
      if (!$el.hasClass('content-fixed')) {
        $el.data('scrolled-from', $el.offset().top);
        var height = Math.max($el.height(), 1);
        $el.before('<div class="shim" style="width: '+ $el.width() + 'px; height: ' + height + 'px">&nbsp;</div>');
        $el.css('width', $el.width() + "px").addClass('content-fixed');
      }
    },
    release: function($el){
      if($el.hasClass('content-fixed')){
        $el.data('scrolled-from', false);
        $el.removeClass('content-fixed').css('width', '');
        $el.siblings('.shim').remove();
      }
    }
  };
  root.GOVUK.stickAtTopWhenScrolling = sticky;
}).call(this);
// Stop scrolling at footer.
//
// This can be added to elements with `position: fixed` to stop them from
// overflowing on the footer.
//
// Usage:
//
//    GOVUK.stopScrollingAtFooter.addEl($(node), $(node).height());
//
// Height is passed in separatly incase the scrolling element has no height
// itself.


(function () {
  "use strict";
  var root = this,
      $ = root.jQuery;
  if(typeof root.GOVUK === 'undefined') { root.GOVUK = {}; }

  var stopScrollingAtFooter = {
    _pollingId: null,
    _isPolling: false,
    _hasScrollEvt: false,
    _els: [],

    addEl: function($fixedEl, height){
      var fixedOffset;

      if(!$fixedEl.length) { return; }

      fixedOffset = parseInt($fixedEl.css('top'), 10);
      fixedOffset = isNaN(fixedOffset) ? 0 : fixedOffset;

      stopScrollingAtFooter.updateFooterTop();
      $(root).on('govuk.pageSizeChanged', stopScrollingAtFooter.updateFooterTop);

      var $siblingEl = $('<div></div>');
      $siblingEl.insertBefore($fixedEl);
      var fixedTop = $siblingEl.offset().top - $siblingEl.position().top;
      $siblingEl.remove();

      var el = {
        $fixedEl: $fixedEl,
        height: height + fixedOffset,
        fixedTop: height + fixedTop,
        state: 'fixed'
      };
      stopScrollingAtFooter._els.push(el);

      stopScrollingAtFooter.initTimeout();
    },
    updateFooterTop: function(){
      var footer = $('.js-footer:eq(0)');
      if (footer.length === 0) {
        return 0;
      }
      stopScrollingAtFooter.footerTop = footer.offset().top - 10;
    },
    initTimeout: function(){
      if(stopScrollingAtFooter._hasScrollEvt === false) {
        $(window).scroll(stopScrollingAtFooter.onScroll);
        stopScrollingAtFooter._hasScrollEvt = true;
      }
    },
    onScroll: function(){
      if (stopScrollingAtFooter._isPolling === false) { 
        stopScrollingAtFooter.startPolling();
      }
    },
    startPolling: (function(){
      if (window.requestAnimationFrame) {
        return (function(){
          var callback = function(){
            stopScrollingAtFooter.checkScroll();
            if (stopScrollingAtFooter._isPolling === true) {
              stopScrollingAtFooter.startPolling();
            }
          };
          stopScrollingAtFooter._pollingId = window.requestAnimationFrame(callback);
          stopScrollingAtFooter._isPolling = true;
        });
      } else {
        return (function(){
          stopScrollingAtFooter._pollingId = window.setInterval(stopScrollingAtFooter.checkScroll, 16);
          stopScrollingAtFooter._isPolling = true;
        });
      }
    }()),
    stopPolling: (function(){
      if (window.requestAnimationFrame) {
        return (function(){
          window.cancelAnimationFrame(stopScrollingAtFooter._pollingId);
          stopScrollingAtFooter._isPolling = false;
        });
      } else {
        return (function(){
          window.clearInterval(stopScrollingAtFooter._pollingId);
          stopScrollingAtFooter._isPolling = false;
        });
      }
    }()),
    checkScroll: function(){
      var cachedScrollTop = $(window).scrollTop();
      if ((cachedScrollTop < (stopScrollingAtFooter.cachedScrollTop + 2)) && (cachedScrollTop > (stopScrollingAtFooter.cachedScrollTop - 2))) {
        stopScrollingAtFooter.stopPolling();
        return;
      } else {
        stopScrollingAtFooter.cachedScrollTop = cachedScrollTop;
      }

      $.each(stopScrollingAtFooter._els, function(i, el){
        var bottomOfEl = cachedScrollTop + el.height;

        if (bottomOfEl > stopScrollingAtFooter.footerTop){
          stopScrollingAtFooter.stick(el);
        } else {
          stopScrollingAtFooter.unstick(el);
        }
      });
    },
    stick: function(el){
      if(el.state === 'fixed' && el.$fixedEl.css('position') === 'fixed'){
        el.$fixedEl.css({ 'position': 'absolute', 'top': stopScrollingAtFooter.footerTop - el.fixedTop });
        el.state = 'absolute';
      }
    },
    unstick: function(el){
      if(el.state === 'absolute'){
        el.$fixedEl.css({ 'position': '', 'top': '' });
        el.state = 'fixed';
      }
    }
  };

  root.GOVUK.stopScrollingAtFooter = stopScrollingAtFooter;

  $(root).load(function(){ $(root).trigger('govuk.pageSizeChanged'); });
}).call(this);
