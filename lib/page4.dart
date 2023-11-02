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
        title: Text("titleeeee"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller.chang();
            },
            child: Text("按钮}"),
          ),
          Expanded(
            child: Obx(() {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.chang();
                },
                child: ListView.builder(
                  itemCount: controller.listX != null ? controller.listX.length : 0,
                  itemBuilder: (context, index) {
                    return Text(controller.listX[index]);
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

class MyControl extends GetxController {
  var listX = <String>[].obs;

  Future<dynamic> chang() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        listX.value = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
        listX.refresh();
      },
    );
  }
}
