import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void main() {
  runApp(Page3());
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
      home: ScaffoldXX1(),
    );
  }
}

class ScaffoldXX1 extends StatelessWidget {
  var isShow = true.obs;

  changxxx() {
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => isShow.value = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    changxxx();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text("data_from_page1"),
      ),
      body: Obx(() {
        return Container(
          child: isShow.value == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : ListView(
                  children: [
                    Container(
                      height: 60,
                      alignment: const Alignment(0.0, -1.0),
                      // alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text("data_from_page1"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.teal,
                          child: const Text("data_from_page1"),
                        ),
                        const Text("data_from_page1")
                      ],
                    ),
                    const Icon(Icons.add, size: 50),
                    //Stack+Positioned 相当于决对布局
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          color: Colors.teal,
                          height: 100,
                          width: 100,
                          child: const Icon(
                            Icons.find_in_page,
                            size: 50,
                          ),
                        ),
                        const Positioned(top: 13, left: 20, child: Text("data_from_page2")),
                        const Text("data_from_page1")
                      ],
                    ),
                    const SizedBox(height: 2.0),

                    //AspectRatio 宽高比控件（外层的只能写一个）
                    Container(
                      color: Colors.green,
                      width: 100, //宽不起作用listview里面宽是最大的
                      child: const AspectRatio(
                        //根据父组件设置自己的一个大小
                        aspectRatio: 4 / 1, //宽比高
                        child: SizedBox(
                          width: 100, //被AspectRatio包的宽高就不起作用了
                          child: Center(child: Text("AspectRatio")),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.0),

                    //FractionallySizedBox
                    Center(
                      child: Container(
                        width: 200,
                        height: 80,
                        color: Colors.green,
                        child: FractionallySizedBox(
                          widthFactor: 0.5, //宽是父组件的0.5
                          heightFactor: 1.1,//高是父组件的1.1，可越界父组件
                          child: Container(
                            color: Colors.red,
                            child: const Text("FractionallySizedBox"),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1, //占两份
                          child: Container(
                            color: Colors.amberAccent,
                            height: 20,
                            /*不设置交叉轴，默认剧中*/
                            child: const Text("这是一个Expanded"),
                          ),
                        ),
                        Expanded(
                          flex: 1, //占一分
                          child: Container(
                            color: Colors.teal,
                            height: 50,
                            child: const Text("这是一个Expanded"),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    //Flexible填满主轴可用空间
                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.indigoAccent,

                          /// 此组件在主轴方向占据48.0逻辑像素,其它空间被 Flexible填满
                          width: 48.0, height: 20,
                        ),

                        /// 此组件会填满Row在主轴方向的剩余空间，撑开Row（fit: FlexFit.tight需要加这个属性）
                        Flexible(
                            //或者Expand（不需要fit属性）
                            fit: FlexFit.tight,
                            child: Container(color: Colors.deepOrange, child: const Text("这个剩余空间被自动填满")))
                      ],
                    ),
                    const Divider(),
                    //Row中子控件两端对齐 //1.主轴设置两端对齐
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, //主轴设置两端对齐
                      children: <Widget>[
                        Container(color: Colors.indigoAccent, width: 48.0, height: 40, child: const Text("这是第一个方块")),
                        Container(color: Colors.deepOrange, width: 48.0, height: 40),
                        Container(color: Colors.indigoAccent, width: 48.0, height: 30),
                      ],
                    ),
                    //Row中子控件两端对齐 //2.Expanded填充
                    Row(
                      children: <Widget>[
                        Container(color: Colors.indigoAccent, width: 48.0, height: 40, child: const Text("Expanded演示")),
                        const Expanded(child: SizedBox()), //会占掉剩余的空间(高度没有设置默认是0，只是把宽度拉申占满了)
                        Container(color: Colors.indigoAccent, width: 48.0, height: 30),
                      ],
                    ),
                    //Row中子控件两端对齐 //3.Spacer填充
                    Row(
                      children: <Widget>[
                        Container(color: Colors.indigoAccent, width: 48.0, height: 40, child: const Text("这是第一个方块")),
                        const Spacer(), //会占掉剩余的空间
                        Container(color: Colors.indigoAccent, width: 48.0, height: 30),
                      ],
                    ),
                    //Row如何让文字不居中显示
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Expanded自动占满左则空间，
                        Expanded(
                          child: Container(
                            color: Colors.amberAccent,
                            child: Column(
                              //Column交叉自动居中的，需要包一层加上width: double.infinity属性，占满父空间
                              children: [
                                //文字不居中显示
                                Container(width: double.infinity, child: const Text("这是第一个方块"), color: Colors.blue),
                                const Text("名字名字名字名字"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/banner_bg.jpg',
                          width: 60,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Container(color: Colors.yellowAccent, width: 200, height: 200, child: const FlutterLogo()),
                      ],
                    ),
                  ],
                ),
        );
      }),
    );
  }
}

class ScaffoldXX extends StatefulWidget {
  ScaffoldXX({super.key});

  @override
  State<StatefulWidget> createState() {
    return Mystate();
  }
}

class Mystate extends State<ScaffoldXX> {
  var isShow = true.obs;

  changxxx() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        return isShow.value = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    changxxx();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text("data_from_page1"),
      ),
      body: Obx(() {
        return Container(
          child: isShow.value == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.teal,
                      child: const Text("data_from_page1"),
                    ),
                    const Text("data_from_page1")
                  ],
                ),
        );
      }),
    );
  }
}
