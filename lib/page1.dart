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
      body: Column(
        children: [
          ConstrainedBox(
            // constraints: BoxConstraints.tight(const Size(100, 100)), //强制固定为特定尺寸
            // constraints: BoxConstraints.loose(const Size(100, 100)), //允许子组件最大为 100x100，最小可以是 0x0
            constraints: const BoxConstraints(
              //自己设置一个范围
              minWidth: 10,
              maxWidth: 100,
              minHeight: 10,
              maxHeight: 100,
            ),
            child: Container(
              color: Colors.blue.shade50,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 50),
          //UnconstrainedBox=> 解除父组件的约束
          //父组件限制最大宽高为 100
          //需要子组件不受父组件限制，自由展示真实尺寸（如绘制一个比父容器大的临时标记）。
          ConstrainedBox(
            constraints: BoxConstraints.tight(const Size(100, 100)),
            child: UnconstrainedBox(
              // 子组件可以突破父组件的 100x100 限制
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 50),

          ElevatedButton(
            child: const Text('下一页'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const Page2(
                          data_from_page1: "我是传过来的",
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
