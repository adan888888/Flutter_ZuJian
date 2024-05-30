import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('测试 防快点'),
        // backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Obx(() => Text("${count.value}", style: const TextStyle(fontSize: 70))),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () {
          debounce(
            ///这里必须传obs类型
            count,
            ///这里的类型就是obs的value类型
            (a) {
              print('$count');
              count++;
            },
            time: const Duration(milliseconds: 5000),
          );
        },
      ),
    );
  }
}
