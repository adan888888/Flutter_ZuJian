import 'package:flutter/cupertino.dart';
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
        body: Center(
          child: Container(
            color: Colors.green[200],
            constraints: const BoxConstraints( ///constraints更改了container的约束
              maxHeight: 200,
              maxWidth: 200,
              minHeight: 20,
              minWidth: 20,
            ),
            child: Stack(
              fit: StackFit.passthrough,
              alignment: Alignment(-1, 0.75),///Alignment.topRight   Alignment(0, 0)是中心对齐   默认是左上
              children: [
                const Positioned(top: 0, left: 0, child: FlutterLogo(size: 50)),
                Container(width: 300, height: 300, color: Colors.lightBlue),
                const Text('text', style: TextStyle(fontSize: 70)) //默认会以不是Positioned包装的来确定大小
              ],
            ),
          ),
        ),
      ),
    );
  }
}
