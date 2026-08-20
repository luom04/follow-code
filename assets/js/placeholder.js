(function ($) {
  const DATA_KEY = 'placeholderTyper';

  function Typer($el, opts) {
    this.$el = $el;
    this.opts = $.extend({
      strings: [],       // mảng câu hiển thị
      typeSpeed: 70,     // ms/char
      deleteSpeed: 40,   // ms/char
      hold: 1000,        // pause sau khi gõ xong 1 câu
      delayBetween: 300, // pause trước khi gõ câu kế
      loop: true,
      pauseOnFocus: true
    }, opts || {});

    // Cho phép set bằng data-placeholders="a|b|c"
    const dataStr = this.$el.data('placeholders');
    if (!this.opts.strings.length && typeof dataStr === 'string') {
      this.opts.strings = dataStr.split('|').map(s => s.trim()).filter(Boolean);
    }

    this.original = this.$el.attr('placeholder') || '';
    this.i = 0;          // index câu
    this.pos = 0;        // vị trí ký tự trong câu
    this.mode = 'type';  // 'type' | 'hold' | 'delete' | 'delay'
    this.timer = null;
    this.running = false;

    // focus/blur auto pause
    if (this.opts.pauseOnFocus) {
      this.$el.on('focus.' + DATA_KEY, () => this.pause(true));
      this.$el.on('blur.' + DATA_KEY, () => this.resume());
    }
  }

  Typer.prototype.step = function () {
    if (!this.running) return;

    const list = this.opts.strings;
    if (!list || !list.length) return;

    const text = list[this.i % list.length];

    if (this.mode === 'type') {
      this.pos++;
      this.$el.attr('placeholder', text.slice(0, this.pos));
      if (this.pos < text.length) {
        this.timer = setTimeout(() => this.step(), this.opts.typeSpeed);
      } else {
        this.mode = 'hold';
        this.timer = setTimeout(() => { this.mode = 'delete'; this.step(); }, this.opts.hold);
      }
      return;
    }

    if (this.mode === 'delete') {
      this.pos--;
      this.$el.attr('placeholder', text.slice(0, Math.max(this.pos, 0)));
      if (this.pos > 0) {
        this.timer = setTimeout(() => this.step(), this.opts.deleteSpeed);
      } else {
        this.mode = 'delay';
        this.i++;
        if (!this.opts.loop && this.i >= list.length) {
          this.stop(true);
          return;
        }
        this.timer = setTimeout(() => { this.mode = 'type'; this.step(); }, this.opts.delayBetween);
      }
      return;
    }
  };

  Typer.prototype.start = function () {
    if (this.running) return;
    this.running = true;
    this.mode = 'type';
    this.step();
  };

  Typer.prototype.pause = function (restoreOriginal) {
    this.running = false;
    clearTimeout(this.timer);
    if (restoreOriginal) {
      this.$el.attr('placeholder', this.original);
    }
  };

  Typer.prototype.resume = function () {
    if (this.running) return;
    this.running = true;
    this.step();
  };

  Typer.prototype.stop = function (restoreOriginal) {
    this.running = false;
    clearTimeout(this.timer);
    if (restoreOriginal) {
      this.$el.attr('placeholder', this.original);
    }
  };

  Typer.prototype.destroy = function () {
    this.stop(true);
    this.$el.off('.' + DATA_KEY);
    this.$el.removeData(DATA_KEY);
  };

  $.fn.placeholderTyper = function (option) {
    return this.each(function () {
      const $this = $(this);
      let inst = $this.data(DATA_KEY);

      if (typeof option === 'string') {
        if (inst && typeof inst[option] === 'function') inst[option]();
        return;
      }

      if (!inst) {
        inst = new Typer($this, option);
        $this.data(DATA_KEY, inst);
        inst.start();
      }
    });
  };
})(jQuery);