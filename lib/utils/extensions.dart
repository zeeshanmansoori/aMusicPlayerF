extension IntExtensions on int {
  String toTimeStampString() {
    int seconds = this ~/ 1000;
    int mins = seconds ~/ 60;
    seconds = seconds % 60;
    int hrs = mins ~/ 60;
    mins = mins % 60;
    var result = "";
    if (hrs > 0) {
      result += "${hrs.toTwoDigitString()}:";
    }
    result += "${mins.toTwoDigitString()}:";
    result += seconds.toTwoDigitString();
    return result;
  }
}

extension NumExtensions on num {
  String toTwoDigitString() {
    if (this > 10) {
      return toString();
    } else {
      return "0$this";
    }
  }
}
