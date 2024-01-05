import 'package:flutter/material.dart';
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
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      alignment: Alignment.topLeft,
                      color: Colors.red,
                      width: 70,
                      child: const AspectRatio(
                        aspectRatio: 1 / 0.8,
                        child: Icon(Icons.ad_units),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    GestureDetector(
                      onTap: () => print("==测试0=="),
                      child: Container(
                        alignment: Alignment.topLeft,
                        color: Colors.red,
                        width: 70,
                        height: 50,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1, //占两份
                          child: Container(
                            color: Colors.amberAccent,
                            height: 50,
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
                        Container(color: Colors.indigoAccent, width: 48.0, height: 40, child: const Text("这是第一个方块")),
                        Expanded(child: SizedBox()), //会占掉剩余的空间
                        Container(color: Colors.indigoAccent, width: 48.0, height: 30),
                      ],
                    ),
                    //Row中子控件两端对齐 //3.Spacer填充
                    Row(
                      children: <Widget>[
                        Container(color: Colors.indigoAccent, width: 48.0, height: 40, child: const Text("这是第一个方块")),
                        Spacer(), //会占掉剩余的空间
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
                              //左则空间占满导致了这里面的两个控件自动居中，需要包一层加上width: double.infinity属性，占满父空间
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Text("这是第一个方块"),
                                  color: Colors.blue,
                                ),
                                Text("名字"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/banner-bg.jpg',
                          width: 60,
                          fit: BoxFit.cover,
                        )
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
