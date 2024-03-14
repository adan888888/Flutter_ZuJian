import 'dart:math';

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
      home: const MyHomePage(title: ""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _buildScrollablePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget _buildScrollablePage() {
  return Material(
    child: CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            background: Image.asset(
              "assets/images/banner-bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 50,
                color: Colors.red.withOpacity(0.8),
                child: Text('Gride View 标题SliverToBoxAdapter'))),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            //相当于GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text('grid item $index'),
              ),
              childCount: 20,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                color: Colors.amber.withOpacity(0.5),
                child: Text('Listview 标题SliverToBoxAdapter'))),

        SliverFixedExtentList(
          //相当于Listview+高度
          itemExtent: 50.0, //每个item高度
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Color(Random().nextInt(0xffffff)).withOpacity(0.5),
                child: Text('list item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ),
  );
}
