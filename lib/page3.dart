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
                        const Positioned(
                            top: 13, left: 20, child: Text("data_from_page2")),
                        const Text("data_from_page1")
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    const Flexible(child: Text("这是一个Flexible")),
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
                          flex: 5, //占两份
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
                    )
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
