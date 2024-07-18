import 'dart:async';

class Throttler {
  Throttler(this.interval);
  final Duration interval;

  void Function()? _action;
  Timer? _timer;

  void call(void Function() action) {
    if(_timer != null) return;

    _action = action;
    // If no timer is running, we want to start one
    if (_timer == null) {
      // Start a timer that will temporarily throttle subsequent calls, and eventually make a call to whatever _action is (if anything)
      _timer = Timer(interval, _callAction);
    }
  }

  void _callAction() {
    _action?.call(); // If we have an action queued up, complete it.
    _action = null; // Once an action is called, do not call the same action again unless another action is queued.
    _timer = null;
  }

  void reset() {
    _action = null;
    _timer = null;
  }
}
