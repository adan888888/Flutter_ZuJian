import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: const Text('标题'), centerTitle: true),
        body:
            /* Container(
         color: Colors.green,
          // child: const SizedBox(height: 100, width: 200, child: Card(child: Text('hello jim'), elevation: 0.8)),
          // child: SizedBox.expand( child: Card(child: Text('hello jim'))), //占满父组件的空间
          // child: SizedBox.shrink( child: Card(child: Text('hello jim'))), //不给以最小的的显示
          child: FittedBox(
            child: Container(
              width: 200,
              height: 200,
            ),
          ),
        ),*/
            buildContainer(),
      ),
    );
  }

  /**
   * OverflowBox 可以让子组件超过父组件
   */
  Container buildContainer() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue[100],
      padding: EdgeInsets.all(15),
      child: OverflowBox(
        alignment: Alignment.topLeft, //没有这个属性，就会覆盖所有
        maxWidth: 300,
        maxHeight: 500,
        child: Container(
          child: AspectRatio(aspectRatio: 6/4),
          width: 1000,
          height: 1000,
          color: Colors.amber,
        ),
      ),
    );
  }
}
