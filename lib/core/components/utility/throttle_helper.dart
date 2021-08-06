import 'dart:async';

class ThrottleStringHelper {
  String? _previousText;

  final int _maxTimerValue = 5;
  int _timerValue = 0;
  ThrottleStringHelper() {
    _setMaxValue();
  }

  void onDelayTouch(String text, Function(String? text) onComplete) {
    _previousText = text;
    if (_timerValue == _maxTimerValue) {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _timerValue--;
        if (_timerValue == 0) {
          onComplete(_previousText);
          timer.cancel();
          _setMaxValue();
        }
      });
    } else {
      _setMaxNearValue();
    }
  }

  void _setMaxNearValue() {
    _timerValue = _maxTimerValue - 1;
  }

  void _setMaxValue() {
    _timerValue = _maxTimerValue;
  }
}
