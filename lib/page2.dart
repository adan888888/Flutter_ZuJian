import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.data_from_page1});

  final String data_from_page1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data_from_page1),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Page3()));
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  void initState() {
    super.initState();
    print('page3初始化了');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('page3')),
      body: null,
    );
  }
}
