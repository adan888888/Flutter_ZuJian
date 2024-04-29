import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _globalKey = GlobalKey();

/*  void _incrementCounter() {
    var currentState = _globalKey.currentState; //获取子控件的状态，执行子组件的方法
    var currentWidget = _globalKey.currentWidget; //获取子控件的属性
    var renderObject = _globalKey.currentContext?.findRenderObject(); //获取渲染的属性
    print('测试===>${currentState}');
    print('测试===>${_globalKey.currentContext}');
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent, title: Text(widget.title)),
      body: Center(
        child: Box(
          key: _globalKey,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //1.获取currentState 子Widget 的属性，方法
          var currentState = _globalKey.currentState as _BoxState;
          setState(() {
            currentState._counter++; //改变子控件的属性，还可以拿到方法...
          });
          //2.获取子Widget(了解)
          var box = (_globalKey.currentWidget as Box);
          print('===>${box.color}'); //MaterialColor(primary value: Color(0xfff44336))

          //3.获取子控件渲染属性（了解）
          var renderBox = (_globalKey.currentContext?.findRenderObject() as RenderBox);
          print('===>${renderBox.size}'); //Size(100.0, 817.0)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Box extends StatefulWidget {
  Color color;

  Box({Key? key, required this.color}) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _counter++;
            });
          },
          child: Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ),
        ),
      ],
    );
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
