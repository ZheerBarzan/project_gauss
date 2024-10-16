import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var question = "";
  var answer = "";

  final List<String> buttons = [
    "AC",
    "DEL",
    " % ",
    " / ",
    "9",
    "8",
    "7",
    " x ",
    "6",
    "5",
    "4",
    " - ",
    "3",
    "2",
    "1",
    " + ",
    "0",
    ".",
    "00",
    " = ",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey,
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        question,
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Buttons(
                              buttonPressed: () {
                                setState(() {
                                  question = "";
                                  answer = "";
                                });
                              },
                              buttonText: buttons[index],
                              textColor: Colors.white,
                              color: Colors.blue);
                        } else if (index == 1) {
                          return Buttons(
                              buttonPressed: () {
                                setState(() {
                                  question = question.substring(
                                      0, question.length - 1);
                                });
                              },
                              buttonText: buttons[index],
                              textColor: Colors.white,
                              color: Colors.red);
                        } else if (index == buttons.length - 1) {
                          return Buttons(
                              buttonPressed: () {
                                setState(() {
                                  equalPressed();
                                });
                              },
                              buttonText: buttons[index],
                              textColor: Colors.white,
                              color: Colors.black);
                        } else {
                          return Buttons(
                            buttonPressed: () {
                              setState(() {
                                question += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            textColor: isOperator(buttons[index])
                                ? Colors.black
                                : Colors.white,
                            color: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.black,
                          );
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isOperator(String number) {
    if (int.tryParse(number) != null || number == ".") {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalQuestion = question;
    finalQuestion = finalQuestion.replaceAll(" x ", "*");
    Parser p = Parser();
    Expression expression = p.parse(finalQuestion);
    ContextModel contextModel = ContextModel();
    double evaluation = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluation.toString();
  }
}
