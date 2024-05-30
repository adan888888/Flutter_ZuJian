import 'package:flutter/material.dart';

main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 40, 0, 0),
            width: 350,
            height: 300,
            color: Colors.lightBlue,
            child: Center(
              child: Container(height: 200, width: 500, color: Colors.red.withOpacity(0.8), child: Text("hhh-hhhhh")),
            ),
          ),
        ),
      ),
    );
  }
}
