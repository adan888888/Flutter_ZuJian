import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart ' as MyDio;

main() {
  runApp(const GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  void getHttp() async {
    MyDio.Response response = await MyDio.Dio().get("http://192.168.128.45:8080/user");
    print(response);
  }

  void postHttp() async {
    var dio = MyDio.Dio();
    var formData = MyDio.FormData.fromMap({"account": "", "pwd": "dfd"});
    MyDio.Response response = await dio.post("http://192.168.128.45:8080/user", data: formData);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fdfdfdf ',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('标题'),
        ),
        body: ElevatedButton(
          child: const Text("点我"),
          onPressed: () {
            Get.snackbar("title", "这里是内容。这里是内容这里是内容这里是内容", icon: const Icon(Icons.message));
            getHttp();
          },
        ),
      ),
    );
  }
}
