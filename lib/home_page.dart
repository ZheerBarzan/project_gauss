import 'package:flutter/material.dart';
import 'buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    "AC",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
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
                            buttonText: buttons[index],
                            textColor: Colors.white,
                            color: Colors.blue);
                      } else if (index == 1) {
                        return Buttons(
                            buttonText: buttons[index],
                            textColor: Colors.white,
                            color: Colors.red);
                      } else if (index == 18) {
                        return Buttons(
                            buttonText: buttons[index],
                            textColor: Colors.black,
                            color: Colors.yellow);
                      } else {
                        return Buttons(
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
    );
  }

  bool isOperator(String number) {
    if (int.tryParse(number) != null || number == ".") {
      return true;
    } else {
      return false;
    }
  }
}
