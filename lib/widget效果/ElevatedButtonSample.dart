import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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

  const MyHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => MyState();
}

class MyState extends State<MyHomePage> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print('点击按钮');
              },
              style: ButtonStyle(
                ///按钮颜色
                backgroundColor: const MaterialStatePropertyAll<Color>(Colors.red),
                ///按键大小设置
                minimumSize: MaterialStateProperty.all(Size(Size.zero.width,27)),
                ///圆角大小
                // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0), // 设置圆角大小
                //   ),
                // ),

                ///圆形
                shape: MaterialStateProperty.all(CircleBorder(side: BorderSide(width: 10,color: Colors.transparent))),

                ///按钮字体颜色
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      // return Theme.of(context).colorScheme.error.withOpacity(0.5);
                      return Colors.yellow;
                    }
                    return null; // Use the component's default.
                  },
                ),

                ///按下的颜色
                overlayColor: const MaterialStatePropertyAll<Color>(Colors.green),
              ),
              child: const Text(
                'Go to Second Page',
              ),
            ),
            AnimatedContainer(
              duration: const Duration(microseconds: 500),
              width: _big ? 200 : 60,
              height: 60,
              child: Material(
                color: Colors.purple,
                elevation: 4, //影子
                shape: const StadiumBorder(),
                child: InkWell(
                  //InkWell的作用就是可能找到上级Material实现水波效果
                  customBorder: const StadiumBorder(), //水波纹的时候全圆角不要绘制出来
                  onTap: () => setState(() => _big = !_big),
                  child: Center(
                    child: _big ? const Text("Ready!") : const Icon(Icons.arrow_forward_rounded),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
