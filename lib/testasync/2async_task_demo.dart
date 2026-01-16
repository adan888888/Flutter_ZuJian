import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网络请求并发示例',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AsyncTaskDemo(),
    );
  }
}

class AsyncTaskDemo extends StatefulWidget {
  const AsyncTaskDemo({super.key});

  @override
  State<AsyncTaskDemo> createState() => _AsyncTaskDemoState();
}

class _AsyncTaskDemoState extends State<AsyncTaskDemo> {
  String _result = '等待任务...';
  bool _isLoading = false;

  // 演示：Future.wait() 中的网络请求是并发执行的
  Future<void> _networkRequestsConcurrent() async {
    setState(() {
      _isLoading = true;
      _result = '同时发起两个网络请求...';
    });

    print('开始时间: ${DateTime.now()}');

    // ✅ Future.wait() 中的网络请求是并发执行的
    // 两个请求会同时发起，不是第一个完成后再发起第二个
    // 总时间 ≈ max(请求1时间, 请求2时间)，而不是两者相加
    final results = await Future.wait([
      _mockNetworkRequest('接口1', 2),
      _mockNetworkRequest('接口2', 3),
    ]);

    print('结束时间: ${DateTime.now()}');
    setState(() {
      _result = '两个请求完成: ${results.join(", ")}\n'
          '总时间约 3 秒（并发执行，不是 2+3=5 秒）';
      _isLoading = false;
    });
  }

  // 模拟网络请求
  Future<String> _mockNetworkRequest(String name, int seconds) async {
    print('$name 开始请求: ${DateTime.now()}');
    // 模拟网络延迟
    await Future.delayed(Duration(seconds: seconds));
    print('$name 请求完成: ${DateTime.now()}');
    return '$name(耗时${seconds}秒)';
  }

  // 对比：串行执行网络请求
  Future<void> _networkRequestsSequential() async {
    setState(() {
      _isLoading = true;
      _result = '串行执行两个网络请求...';
    });

    print('开始时间: ${DateTime.now()}');

    // ❌ 串行执行：第一个完成后再执行第二个
    // 总时间 = 请求1时间 + 请求2时间
    final result1 = await _mockNetworkRequest('接口1', 2);
    final result2 = await _mockNetworkRequest('接口2', 3);

    print('结束时间: ${DateTime.now()}');
    setState(() {
      _result = '两个请求完成: $result1, $result2\n'
          '总时间约 5 秒（串行执行，2+3=5 秒）';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求并发示例'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading) ...[
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
              ],
              const SizedBox(height: 20),
              Text(
                _result,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                '网络请求：并发 vs 串行',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Future.wait() 中的网络请求会同时发起\n不是第一个完成后再发起第二个',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isLoading ? null : _networkRequestsConcurrent,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                    child: const Text('Future.wait（并发）'),
                  ),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _networkRequestsSequential,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo),
                    child: const Text('串行执行'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
