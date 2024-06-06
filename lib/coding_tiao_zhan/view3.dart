import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

//转账明细
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text("转给巴勒斯坦国驻华大使馆"),
              const Text("- #9,999.00"),
              buildRow('收款账户', '7783 5002 1382'),
              const SizedBox(height: 20),
              buildRow('收款银行', '中国银行'),
              const SizedBox(height: 20),
              buildRow('付款账户', '6226********2009'),
              const SizedBox(height: 20),
              buildRow('转账附言', '愿世界和平，愿再无战争和伤痛'),
              const SizedBox(height: 20),
              buildRow('转账渠道', '手机银行'),
              const SizedBox(height: 20),
              buildRow('转账方式', '电子银行转账'),
              const SizedBox(height: 100),
              Row(
                children: [
                  Container(height: 15, width: 15,decoration: const ShapeDecoration(shape: CircleBorder(), color: Color(0xFF50A95E))),
                  const SizedBox(width: 3),
                  const Text("转账完成",style: TextStyle(color: Color(0xFF50A95E))),
                ],
              ),

              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2024-06-01 12:18:21"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("进度查询"),Icon(Icons.keyboard_arrow_right,color: Colors.grey)
                    ],
                  ),
                ],
              )
              , const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("通知收款人",style:TextStyle(color:  Color(0xff637894))),
                  Icon(Icons.keyboard_arrow_right,color: Colors.grey)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow(String s, String y) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(s, style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black87.withOpacity(0.5))),
        Text(y,style: const TextStyle(fontSize: 13,)),
      ],
    );
  }
}
