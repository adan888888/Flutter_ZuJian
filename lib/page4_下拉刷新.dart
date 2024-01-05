import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(const Page4());
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends GetView<MyControl> {
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyControl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("titleeeee"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller.add();
            },
            child: const Text("按钮}"),
          ),
          Expanded(
            child: Obx(() {
              return EasyRefresh(
                controller: controller._controller,
                header: DeliveryHeader()
                // const ClassicHeader(
                //   processedDuration: const Duration(seconds: 1),
                //   showMessage: false,
                //   showText: true,
                //   position: IndicatorPosition.behind,
                //   processingText: "正在刷新...",
                //   readyText: "正在刷新...",
                //   armedText: "释放以刷新",
                //   dragText: "下拉刷新",
                //   processedText: "刷新成功",
                //   failedText: "刷新失败",
                // )
                ,
                footer: const ClassicFooter(),
                onRefresh: () => controller.chang(),
                onLoad: () => controller.onLoad(),
                child: ListView.builder(
                  itemCount: controller.listX.isNotEmpty ? controller.listX.length : 0,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [Text(controller.listX[index]), const Divider(height: 2)]),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class MyControl extends GetxController with StateMixin{
  late final EasyRefreshController _controller =
      EasyRefreshController(controlFinishRefresh: true, controlFinishLoad: true);

  var listX = <String>[].obs;
  // late RxList listX=[].obs;
 var map= Map();


  add() {
    listX.value.add("新增");
    listX.refresh();

    map['name']="zdfdflj";
    map['age']="12";

    print(map);
  }

  Future<dynamic> chang() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        listX.value = List.generate(10, (i) => '哈喽,我是新刷新的 $i');
        listX.refresh();
        _controller.finishRefresh();
        _controller.resetFooter();
      },
    );
  }

  Future<dynamic> onLoad() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        listX.value.addAll(List.generate(5, (i) => '我是加载更多的 $i'));
        listX.refresh();
        _controller.finishLoad();
      },
    );
  }
}
