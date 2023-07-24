import 'package:flutter/material.dart';
import 'buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: Container(
                child: Center(
                  child: Buttons(
                    buttonText: "0",
                    textColor: Colors.black,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
