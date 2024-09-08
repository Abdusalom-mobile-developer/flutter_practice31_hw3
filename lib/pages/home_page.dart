import 'package:flutter/material.dart';
import 'package:flutter_practice31_hw3/calculator_logic/calc_logic.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _makeButtons(
      {required String option,
      required bool isBlack,
      required void Function() function}) {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: TextButton(
        onPressed: function,
        child: Text(
          option,
          style: TextStyle(
            fontSize: 38,
            color: isBlack ? Colors.black : Colors.red,
          ),
        ),
      ),
    ));
  }

  StringBuffer _displayValue = StringBuffer();
  List<num> _list = [];
  late String _operation;
  String _lastCalculation = "";
  List<String> _historyOfCalculations = [];

  StringBuffer _checkForZeros() {
    if (_displayValue.length > 2 &&
        _displayValue.toString()[_displayValue.length - 1] == "0" &&
        _displayValue.toString()[_displayValue.length - 2] == ".") {
      var splitedList = _displayValue.toString().split("");
      splitedList.removeRange(splitedList.length - 2, splitedList.length);
      _displayValue.clear();
      _displayValue.write(splitedList.join(""));
      return _displayValue;
    } else {
      return _displayValue;
    }
  }

  void checkValue() {
    if (_displayValue.isEmpty) {
      setState(() {
        _displayValue.write("-");
      });
      _list.add(num.parse("-$_displayValue"));
    } else {
      _operation = "-";
      _list.add(num.parse(_displayValue.toString()));
      _displayValue.clear();
    }
  }

  bool _equalSignPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 45,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.orange[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Calculator",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _displayValue.toString().isNotEmpty
                            ? _checkForZeros().toString()
                            : "0",
                        style: TextStyle(
                            fontSize: 65,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Transform.translate(
                        offset: Offset(0, -9),
                        child: Text(
                          _lastCalculation,
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "History",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _historyOfCalculations.length >= 2
                                ? _historyOfCalculations[
                                    _historyOfCalculations.length - 2]
                                : "",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _makeButtons(
                        option: "C",
                        isBlack: false,
                        function: () {
                          setState(() {
                            _displayValue.clear();
                            _list.removeRange(0, _list.length);
                          });
                        },
                      ),
                      _makeButtons(
                          option: "()",
                          isBlack: true,
                          function: () {
                            setState(() {});
                          }),
                      _makeButtons(
                          option: "%",
                          isBlack: true,
                          function: () {
                            _operation = "%";
                            _list.add(num.parse(_displayValue.toString()));
                            _displayValue.clear();
                          }),
                      _makeButtons(
                          option: "/",
                          isBlack: true,
                          function: () {
                            _operation = "/";
                            _list.add(num.parse(_displayValue.toString()));
                            _displayValue.clear();
                          }),
                    ],
                  ),
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(
                        option: "7",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(7);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(7);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "8",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(8);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(8);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "9",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(9);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(9);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "x",
                        isBlack: true,
                        function: () {
                          setState(() {
                            _operation = "x";
                            _list.add(num.parse(_displayValue.toString()));
                            _displayValue.clear();
                          });
                        }),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(
                        option: "4",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(4);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(4);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "5",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(5);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(5);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "6",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(6);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(6);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "-",
                        isBlack: true,
                        function: () {
                          setState(() {
                            checkValue();
                          });
                        }),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(
                        option: "1",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(1);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(1);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "2",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(2);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(2);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "3",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(3);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(3);
                            }
                          });
                        }),
                    _makeButtons(
                        option: "+",
                        isBlack: true,
                        function: () {
                          setState(() {
                            _operation = "+";
                            _displayValue.isEmpty
                                ? _list.add(num.parse("+$_displayValue"))
                                : _list
                                    .add(num.parse(_displayValue.toString()));
                            _displayValue.clear();
                          });
                        }),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(
                        option: "+/-",
                        isBlack: true,
                        function: () {
                          setState(() {});
                        }),
                    _makeButtons(
                        option: "0",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (_equalSignPressed) {
                              _displayValue.clear();
                              _displayValue.write(0);
                              _equalSignPressed = false;
                            } else {
                              _displayValue.write(0);
                            }
                          });
                        }),
                    _makeButtons(
                        option: ".",
                        isBlack: true,
                        function: () {
                          setState(() {
                            if (!_displayValue.toString().contains(".")) {
                              if (_equalSignPressed) {
                                _displayValue.clear();
                                _displayValue.write(".");
                                _equalSignPressed = false;
                              } else {
                                _displayValue.write(".");
                              }
                            }
                          });
                        }),
                    _makeButtons(
                        option: "=",
                        isBlack: false,
                        function: () {
                          setState(() {
                            _list.add(num.parse(_displayValue.toString()));
                            _displayValue.clear();
                            _displayValue.write(CalcLogic.calculate(
                                _list[_list.length - 2],
                                _list.last,
                                _operation));
                            _lastCalculation =
                                "${_list[_list.length - 2]} ${_operation} ${_list.last}";
                            _historyOfCalculations.add(_lastCalculation);
                            _list.removeRange(0, _list.length);
                            _equalSignPressed = true;
                          });
                        }),
                  ],
                )),
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}
