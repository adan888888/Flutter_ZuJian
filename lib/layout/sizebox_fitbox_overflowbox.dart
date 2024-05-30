import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

///超过父组件
main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: const Text('标题'), centerTitle: true),
        // body: overflowBoxSample(context),
        body: overflowSizeBoxSample(),
        // body: columnSample(),
      ),
    );
  }

  /**
   *
   * 1.OverflowBox自身是没有尺寸的，但是SizedOverflowBox是有的
   * 2.OverflowBox跟SizedOverflowBox的父控件在有BoxConstraints约束的时候，SizedOverflowBox将约束传递给了子控件，
   * 导致子控件受到约束后无法溢出，但是OverflowBox却没有
   */
  Container overflowBoxSample(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      color: Colors.blue,
      height: 50,
      constraints: BoxConstraints(maxHeight: 50),
      child: OverflowBox(
        alignment: Alignment(0, 1),
        //使用这个来进行位置偏移
        minWidth: 20,
        maxWidth: double.infinity,
        maxHeight: 100,
        minHeight: 20,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 120,
          color: Colors.amber,
        ),
      ),
    );
  }

  /**
   * OverflowBoxSizeBox 可以让子组件超过父组件
   */
  overflowSizeBoxSample() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      color: Colors.blue,
      child: SizedOverflowBox(
        // alignment: Alignment(-0, -5), //默认是居中的 使用这个来进行位置偏移
        size: Size(300, 50), //父组件不能传宽高，这里的宽高就是父组件的.  ***如果父类是滑动的，就会移动子组件
        child: Container(
          width: 80,
          height: 150,
          color: Colors.amber,
        ),
      ),
    );
  }

  //在
  columnSample() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      color: Colors.green,
      child: Column(children: [
        SizedOverflowBox(
          size: Size(100, 80),
          child: Container(
            alignment: Alignment(0, 0),
            color: Colors.red,
            width: 300, //可以超过父组件100的
            height: 90,//超过的部分就会往Column上面，越界跑
          ),
        ),
        GFCard(height: 150, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题1", subTitleText: "副标题")),
        GFCard(height: 150, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题2", subTitleText: "副标题")),
        GFCard(height: 150, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题3", subTitleText: "副标题"))
      ]),
    );
  }
}
