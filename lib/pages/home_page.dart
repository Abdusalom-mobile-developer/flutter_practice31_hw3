import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _makeButtons({required String option, required bool isBlack}) {
    return Expanded(
        child: Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
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
                        "16",
                        style: TextStyle(
                            fontSize: 65,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Transform.translate(
                        offset: Offset(0, -9),
                        child: Text(
                          "1590 - 1574",
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
                            "289 * 16",
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
                      _makeButtons(option: "C", isBlack: false),
                      _makeButtons(option: "()", isBlack: true),
                      _makeButtons(option: "%", isBlack: true),
                      _makeButtons(option: "/", isBlack: true),
                    ],
                  ),
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(option: "7", isBlack: true),
                    _makeButtons(option: "8", isBlack: true),
                    _makeButtons(option: "9", isBlack: true),
                    _makeButtons(option: "x", isBlack: true),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(option: "4", isBlack: true),
                    _makeButtons(option: "5", isBlack: true),
                    _makeButtons(option: "6", isBlack: true),
                    _makeButtons(option: "-", isBlack: true),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(option: "1", isBlack: true),
                    _makeButtons(option: "2", isBlack: true),
                    _makeButtons(option: "3", isBlack: true),
                    _makeButtons(option: "+", isBlack: true),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _makeButtons(option: "+/-", isBlack: true),
                    _makeButtons(option: "0", isBlack: true),
                    _makeButtons(option: ".", isBlack: true),
                    _makeButtons(option: "=", isBlack: false),
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
