import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_button_type.dart';

void main() {
  runApp(const GetwidgetSample());
}

class GetwidgetSample extends StatelessWidget {
  const GetwidgetSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyWidget());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets') /*centerTitle: true*/),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Widgets'),
            ),
            GFButton(
              onPressed: () {},
              text: "primary",
              type: GFButtonType.solid,
              blockButton: true,
            ),
            GFBadge(
              child: Text("1"),
              size: GFSize.LARGE,
            ),
          ],
        ),
      ),
    );
  }
}
