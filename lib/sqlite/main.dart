import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/sqlite/sqlite_binding.dart';
import 'package:untitled/sqlite/sqlite_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.home,
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppPages{
  static const String home = '/home';
  static final pages=[
    GetPage(name: home, page: ()=>const SqliteView(),binding: SqliteBinding())
  ];

}