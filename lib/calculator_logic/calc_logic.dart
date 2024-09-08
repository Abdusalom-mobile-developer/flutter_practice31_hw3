class CalcLogic {
  static num calculate(num value1, num value2, String operation) {
    if (operation == "+") {
      return value1 + value2;
    } else if (operation == "-") {
      return value1 - value2;
    } else if (operation == "x") {
      return value1 * value2;
    } else if (operation == "/") {
      num result = value1 / value2;
      List<String> list = result.toString().split("");
      List<String> list2 = [];
      int indexOfDot = list.indexOf(".");
      for (int i = 0; i < indexOfDot; i++) {
        list2.add(list[i]);
      }
      int count = 0;
      for (int i = indexOfDot; i < list.length; i++) {
        if (count < 4) {
          list2.add(list[i]);
        }
        count++;
      }
      return num.parse(list2.join());
    } else if (operation == "%") {
      return value1 % value2;
    }
    return 0;
  }
}


