import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Radio buttons';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        hintColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(text),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all((value == index) ? Colors.red : Colors.white),
          backgroundColor: MaterialStateProperty.all((value == index) ? Colors.green : Colors.yellow)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[CustomRadioButton("Single", 1), CustomRadioButton("Married", 2), CustomRadioButton("Other", 3)],
    );
  }
}
