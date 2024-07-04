import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: ListView(children: [
          ///1.overflowBox
          overflowBoxSample(context),
          const Divider(color: Colors.black87, height: 20),

          ///2.SizedOverflowBox
          overflowSizeBoxSample(),
          const Divider(color: Colors.black87, height: 20),

          ///3.在column中使用
          columnSample(),

          ///4.FittedBox也可以越界
          wContainer(BoxFit.none), //1.BoxFit.none  子多大就是多大
          const Divider(color: Colors.black87, height: 20),
          const Center(child: Text('Wendux')),
          const Divider(color: Colors.black87, height: 20),
          wContainer(BoxFit.contain), //1.BoxFit.contain 不能超过父类
          const Divider(color: Colors.black87, height: 20),
          wContainerx(), //1

          ///5.Clip
          clipRRect_caibian(), //矩形裁剪
          const Divider(color: Colors.black87, height: 20),
          clipOval_caibian(), //椭圆裁剪
        ]),
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
      margin: const EdgeInsets.only(top: 50),
      color: Colors.blue,
      height: 50,
      constraints: const BoxConstraints(maxHeight: 50),
      child: OverflowBox(
        alignment: const Alignment(0, 1),
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
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.blue,
        child: SizedOverflowBox(
          alignment: const Alignment(0, 1), //默认是居中的 使用这个来进行位置偏移（-1底部对齐）
          size: const Size(300, 50), //父组件不能传宽高，这里的宽高就是父组件的.  ***如果父类是滑动的，就会移动子组件***
          child: Container(
            width: 80,
            height: 50 + 10,

            ///比父控件多10，底部对齐，就会往上多出10px
            color: Colors.amber,
          ),
        ),
      ),
    );
  }

  //在
  columnSample() {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      color: Colors.green,
      child: Column(children: [
        SizedOverflowBox(
          alignment: Alignment.bottomCenter,
          size: const Size(100, 120 / 2), //小于了子控件一半，所以会越出一半
          child: Container(
            color: Colors.red,
            //可以超过父组件100的
            width: 300,
            //超过的部分就会往Column上面，越界跑
            height: 120,
            child: const GFCard(margin: EdgeInsets.zero, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题1")),
          ),
        ),
        const SizedBox(height: 20),
        const GFCard(height: 115, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题2", subTitleText: "副标题")),
        const GFCard(height: 115, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题3", subTitleText: "副标题")),
        const GFCard(height: 115, elevation: 20, color: Colors.white, title: GFListTile(titleText: "主标题4", subTitleText: "副标题"))
      ]),
    );
  }
}

Widget wContainer(BoxFit boxFit) {
  return Center(
    child: Container(
      width: 100,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小,默认是受父控件影响，父多大子就是多大
        // 加了 fittedbox 1.BoxFit.none  子多大就是多大   2.BoxFit.contain  子要全在父里面（导致缩小）
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    ),
  );
}

Widget wContainerx() {
  return Center(
    child: Container(
      width: 100,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(child: Text('BoxFit.scaleDown 自体会自动缩小自体',style: TextStyle(fontSize: 13),), color: Colors.blue),
      ),
    ),
  );
}

Widget clipRRect_caibian() {
  /// ClipRRect裁边组件，可以切圆角
  /// 1.Clip.none子组件，可以越出， 2.其它属性 将超出子组件布局范围的绘制内容剪裁掉
  return Center(
    child: ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          //1.BoxFit.none  子多大就是多大
          fit: BoxFit.none, //用了ClipRRect，能不能越界，就用clipBehavior这个属性来控制
          child: Container(width: 30, height: 80, color: Colors.blue),
        ),
      ),
    ),
  );
}

Widget clipOval_caibian() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ClipOval(
        child: Container(
          width: 200, //宽高一样的话，就是圆形
          height: 100,
          color: Colors.yellowAccent,
          child: Image.asset(
            "assets/images/banner_bg.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      ClipOval(
        child: Container(
          width: 80, //宽高一样的话，就是圆形
          height: 80,
          color: Colors.red,
          child: Image.asset(
            "assets/images/banner_bg.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
