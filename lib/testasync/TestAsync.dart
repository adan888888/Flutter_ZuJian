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

///异步
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
    await Future.delayed(const Duration(seconds: 2)).then((value) => setState(() => _count++));

    print('测试111'); //上面的延迟不会影响它下面的代码运行。 上面一行代码加了await那么就会影响

    await test(); //await一加就会影响后面的。
    print('测试333');
  }

  test() async {
    await Future.delayed(const Duration(seconds: 2));//加了await就会等这2秒执行完了，再执行下面的打印输出
    print('测试222');
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
      floatingActionButton:
          FloatingActionButton(onPressed: () => _setCount(), child: const Icon(Icons.add)),
    );
  }
}
