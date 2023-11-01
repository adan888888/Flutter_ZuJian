import 'package:flutter/material.dart';
import 'package:untitled/page2.dart';

void main() {
  runApp(const Page1());
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppPage(),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page11111'),
      ),
      body: ElevatedButton(
        child: const Text('下一页'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Page2(data_from_page1: "我是传过来的",)),
          );
        },
      ),
    );
  }
}
