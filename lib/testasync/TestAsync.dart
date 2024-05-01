import 'dart:ffi';

import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _setCount() async {
    ///异常并不是多线程，跟安卓还是不一样的
    //第一种写法
    /* await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _count++;
    });*/

    //第二种写法 (只是一个语法糖，效果是一样的)
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() => _count++));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _setCount(), child: const Icon(Icons.add)),
    );
  }
}
