import 'package:apps/Apps/5_Calculator/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = "";
  var userAnswer = "";
  final List<String> buttons = [
    'C',
    "DEL",
    "%",
    "/",
    '9',
    "8",
    "7",
    "x",
    '6',
    "5",
    "4",
    "-",
    '3',
    "2",
    "1",
    "+",
    '0',
    ".",
    "ANS",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userQuestion,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Buttons(
                        buttonTaped: () {
                          setState(() {
                            userQuestion = "";
                            userAnswer = "";
                          });
                        },
                        color: isOperator(buttons[index])!
                            ? Colors.yellow[600]
                            : Colors.grey[900],
                        textColor: Colors.white,
                        buttonText: buttons[index],
                      );
                    } else if (index == 1) {
                      return Buttons(
                        buttonTaped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        color: isOperator(buttons[index])!
                            ? Colors.yellow[600]
                            : Colors.grey[900],
                        textColor: Colors.white,
                        buttonText: buttons[index],
                      );
                    } else if (index == buttons.length - 1) {
                      return Buttons(
                        buttonTaped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: isOperator(buttons[index])!
                            ? Colors.yellow[600]
                            : Colors.grey[900],
                        textColor: Colors.white,
                        buttonText: buttons[index],
                      );
                    } else {
                      return Buttons(
                        buttonTaped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        color: isOperator(buttons[index])!
                            ? Colors.yellow[600]
                            : Colors.grey[900],
                        textColor: Colors.white,
                        buttonText: buttons[index],
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  bool? isOperator(String x) {
    if (x == '%' ||
        x == "x" ||
        x == "-" ||
        x == "+" ||
        x == "=" ||
        x == "/" ||
        x == "C" ||
        x == "DEL") {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
