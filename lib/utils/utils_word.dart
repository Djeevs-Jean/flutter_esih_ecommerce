class UtilsWord {

  static String subsWord(String value) {
    int N = 85;
    int countString = value.length;
    if (countString > N) {
      return "${value.substring(0, N)}...";
    } else {
      return value;
    }
  }

}