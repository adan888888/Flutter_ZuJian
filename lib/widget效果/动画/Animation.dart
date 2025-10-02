import 'package:flutter/material.dart';
///隐式--动画AnimatedContainer的使用
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
  var x = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            x = !x;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: x ? 100 : 200,
            height: x ? 100 : 200,
            duration: const Duration(seconds: 3),
            onEnd: () => print('动画结束'),
            curve: Curves.linear,
            color: x ? Colors.yellow : Colors.lightBlue,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              child: x ? const Center(child: FlutterLogo(size: 90)) : const Text("Love You",style: TextStyle(fontSize: 50),),
            ),
          ),
        ),
      ),
    );
  }
}
