import 'dart:ui';

import 'package:flutter/material.dart';

//圆按钮，变成大按钮，之间动画
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white24, brightness: Brightness.light),
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
          Row(),
        ],
      ),
    );
  }
}

class YourButton extends StatefulWidget {
  const YourButton({super.key});

  @override
  State<YourButton> createState() => _YourButtonState();
}

class _YourButtonState extends State<YourButton> {
  var over = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: over ? 60 : 140,
      child: ElevatedButton(
        onPressed: () => setState(() => over = !over),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(const StadiumBorder()),//防止点击效果是正方形
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: over
              ? const Icon(Icons.navigate_next, color: Colors.white)
              : const Text(
                  'Ready',
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
} // 水波纹按钮
