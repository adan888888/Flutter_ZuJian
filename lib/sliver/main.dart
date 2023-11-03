import 'package:flutter/material.dart';

import 'nested.dart';
import 'page.dart';

//https://ducafecat.com/blog/flutter-sliver-scroll
//https://ducafecat.com/blog/flutter-sliver-nested-scroll-view
//https://github.com/ducafecat/flutter_develop_tips

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyPageView(),
      // home: const NestedScrollPage(),
    );
  }
}
