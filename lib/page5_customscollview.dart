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
      // ✅ 关键：Android 上需要设置 physics 才能实现下拉放大效果
      // BouncingScrollPhysics 允许过度滚动（overscroll），iOS 默认就是这个
      // AlwaysScrollableScrollPhysics 也可以，但 BouncingScrollPhysics 效果更自然
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          // 吸顶（必须设为true，否则折叠后消失）
          pinned: true,
          // 轻微下拉就展开（放大）
          floating: true,
          // 轻轻拉一下AppBar迅速出来
          snap: true,
          // 核心：设置展开后的总高度（放大的最大高度）
          expandedHeight: 250,
          //允许到上面设置的250的最大高度时，想继续往下拉
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            //往回缩的效果
            collapseMode: CollapseMode.parallax, // 视差效果（图片滚动速度慢于列表，更自然）
            // collapseMode: CollapseMode.pin, // 图片固定，仅标题栏收缩（无放大/拉伸）
            // collapseMode: CollapseMode.none, // 图片随列表滚动同步拉伸（默认）
            //往下拉的效果
            stretchModes: const [
              // StretchMode.blurBackground,
              StretchMode.zoomBackground,
              StretchMode.fadeTitle
            ],
            title: const Text('Demo'),
            background: Image.asset(
              "assets/images/banner_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        //slivers:里面不能直接放widget，需要使用SliverToBoxAdapter包裹起来
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
              child: Text('Listview 标题SliverToBoxAdapter')),
        ),

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
