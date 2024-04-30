import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    print('context= $context');  ///  MyHomePage
    var renderBox = ((context as Element).findRenderObject() as RenderBox).size;
    print('渲染对象：${renderBox}'); //MyHomePage的大小
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ///第一种
            Foo(count),
            ///第二种
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                print('context=$context'); ///LayoutBuilder   LayoutBuilder的上一级才有Scaffold的
                return ElevatedButton(
                  onPressed: () {Scaffold.of(context).openDrawer();},
                  child: const Text("打开抽屉"),
                );
              },
            ),
            /// 我们不需要 BoxConstraints所以可以不要Layout
            Builder(builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {Scaffold.of(context).openDrawer();},
                child: const Text("打开抽屉"),
              );
            })
          ],
        ),
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            count++; //count不放在setState里面，也会刷新
            // setState(() { //setState是一个新设计。  设计出来context就是为了不让你直接使用markNeedsBuild()
            // });
            (context as Element).markNeedsBuild(); //即使没有任何改动，调了这个方法，也会触发build方法

            (context as Element).findAncestorStateOfType(); //找到离我最近的一个state
            (context as Element).findAncestorWidgetOfExactType(); //找到离我最近的一个widget
            ///下面这些都是需要用到context
            Theme.of(context).textTheme;
            // Provider.of(context);
            // context.watch();
            // context.read();
          }),
    );
  }
}

class Foo extends StatelessWidget {
  int count;

  Foo(this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    print('==context== $context');
    return GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
          print('==onTap==');
        },
        child: Text('$count', style: const TextStyle(fontSize: 30.0)));
  }
}
