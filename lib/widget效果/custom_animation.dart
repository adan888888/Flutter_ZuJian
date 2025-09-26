import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//显示动画
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动画测试',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      //也可以在这里配置范围
      /*    lowerBound: 0,
      upperBound: 1,*/
    );

    // 添加曲线动画
    _animation = Tween(begin: 0.0, end: 1.0) //控制时间
        .chain(CurveTween(curve: Curves.easeInOut)) //控制曲线
        .chain(CurveTween(curve: const Interval(0.3, 0.8))) //可以再. 实现交错动画 （30% 时间点开始， 80% 时间点结束）
        .animate(_controller);

    _scaleAnimation =
        Tween(begin: 1.0, end: 1.5).chain(CurveTween(curve: const Interval(0.3, 0.8))).animate(_controller);

    _rotateAnimation =
        Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: const Interval(0.6, 1.0))).animate(_controller);

    /*  // 立即开始，50%时间点结束
    Interval(0.0, 0.5)

// 50%时间点开始，立即结束
    Interval(0.5, 1.0)

// 延迟开始，快速结束
    Interval(0.7, 1.0)

// 中间执行
    Interval(0.4, 0.6)*/
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('动画测试', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //动画的时候，会自动调用AnimatedBuilder
            AnimatedBuilder(
              animation: _animation, // 使用曲线动画
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_animation.value * 100), // 垂直移动效果
                  child: Transform.scale(
                    scale: 1.0 + _scaleAnimation.value * 0.3, // 放大效果
                    child: Transform.rotate(
                      angle: _rotateAnimation.value * 2 * 3.14159, // 旋转效果 (360度)
                      child: Opacity(
                        opacity: _animation.value.clamp(0, 1), //限制范围
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
