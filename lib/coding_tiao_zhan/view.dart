import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          YourButton(),
          YourButton2(),
          Row(),
        ],
      ),
    );
  }
}

/// 水波纹按钮
class YourButton extends StatelessWidget {
  const YourButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Press'),
      splashColor: Colors.red, //水波纹颜色
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.blue),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min, //这句话非常关键， 要不然会占满屏幕
          children: [
            Icon(Icons.star, color: Colors.blue),
            SizedBox(width: 5),
            Text('收藏', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
} // 水波纹按钮

class YourButton2 extends StatelessWidget {
  const YourButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.star, color: Colors.blue),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor:Colors.red ,
        textStyle: const TextStyle(color: Colors.blue),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),//圆角的半径
          side: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
      label: const Text(
        '收藏',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
