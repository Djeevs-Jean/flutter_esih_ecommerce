class UtilsWord {
  final String value;

  UtilsWord(this.value);

  String subtitleString() {
    int N = 85;
    int countString = value.length;
    if (countString > N) {
      return "${value.substring(0, N)}...";
    } else {
      return value;
    }
  }

}