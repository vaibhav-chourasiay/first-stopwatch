class StopWatchClock {
  int? seconds = 0;
  int? min = 0;
  int? hour = 0;

  StopWatchClock({this.seconds, this.hour, this.min});

  secondsValue() {
    if (seconds! >= 60) {
      seconds = 0;
    } else {
      seconds = seconds! + 1;
    }
  }

  hourValue() {
    hour = hour! + 1;
  }

  minValue() {
    if (min! >= 60) {
      min = 0;
    } else {
      min = min! + 1;
    }
  }

  restartClock() {
    seconds = 0;
    min = 0;
    hour = 0;
  }
}
