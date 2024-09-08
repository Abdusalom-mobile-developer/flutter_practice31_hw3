class CalcLogic {
  static num calculate(num value1, num value2, String operation) {
    if (operation == "+") {
      return value1 + value2;
    } else if (operation == "-") {
      return value1 - value2;
    } else if (operation == "x") {
      return value1 * value2;
    } else if (operation == "/") {
      return value1 / value2;
    }else if (operation == "%"){
      return value1 % value2;
    }
    return 0;
  }
}
