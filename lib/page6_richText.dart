import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent), //不加这个属性默认是蓝色
        useMaterial3: false, //为true不起作用
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('标题'), centerTitle: true),
        body: MyRichText(),
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  MyRichText({super.key});

  var flage = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            text: "jkdlsjflkjm",
            style: TextStyle(color: Colors.red, fontSize: 24),
            children: [
              TextSpan(
                  text: 'blod',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  )),
              TextSpan(
                text: 'world',
              ),
            ],
          ),
        ),
        Obx(() {
          return Checkbox(
            activeColor: Colors.red,
            checkColor: Colors.green,
            hoverColor: Colors.cyanAccent,
            value: flage.value,
            onChanged: (value) {
              flage.value = value!;
            },
          );
        }),
        Obx(() {
          return Text(
            flage.value ? "选中" : "未选中",
          );
        }),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text('Flutter中国....Flutter中国....Flutter中国....Flutter中国....Flutter中国....Flutter中国....Flutter中国....Flutter中国....Flutter中国....')),
            ],
          ),
        ),
      ],
    );
  }
}


