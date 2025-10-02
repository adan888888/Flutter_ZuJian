import 'dart:math';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
//显示动画
void main() {
  runApp(const MyApp());
}


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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  // 抽奖旋转动画控制器
  late AnimationController _lotteryController;
  late Animation<double> _lotteryRotation;
  var num = 0;

  @override
  void initState() {
    super.initState();

    // 抽奖旋转动画控制器 - 先初始化
    _lotteryController = AnimationController(
      duration: const Duration(milliseconds: 3000), // 3秒旋转时间
      vsync: this,
    );

    // 抽奖旋转动画 - 先快后慢的效果
    _lotteryRotation = Tween(begin: 0.0, end: Math.pi) // 初始值为0，会在点击时动态设置
        .chain(CurveTween(curve: Curves.easeOut)) // 先快后慢的曲线
        .animate(_lotteryController);

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
        .chain(CurveTween(
            curve:
                const Interval(0.3, 0.8))) //可以再. 实现交错动画 （30% 时间点开始， 80% 时间点结束）
        .animate(_controller);

    _scaleAnimation = Tween(begin: 1.0, end: 1.5)
        .chain(CurveTween(curve: const Interval(0.3, 0.8)))
        .animate(_controller);

    _rotateAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const Interval(0.6, 1.0)))
        .animate(_controller);

    /*  // 立即开始，50%时间点结束
    Interval(0.0, 0.5)

// 50%时间点开始，立即结束
    Interval(0.5, 1.0)

// 延迟开始，快速结束
    Interval(0.7, 1.0)

// 中间执行
    Interval(0.4, 0.6)*/
  }

  // 生成随机抽奖结果
  void _generateRandomLottery() {
    final targetIndex = Random().nextInt(7) + 1;
    const int circle = 2; // 至少转 5 圈
    const double sectorAngle = 2 * pi / 8; // 每个扇形的角度
    final double targetAngle = targetIndex * sectorAngle;

    // 指针正好盖住一个扇形，所以我们加上 sectorAngle / 2 偏移
    const double offset = sectorAngle / 2 + pi / 8;

    // 最终角度
    final double end = circle * 2 * pi + targetAngle + offset;
    print("旋转角度end: $end");
    _lotteryRotation = Tween<double>(
      begin: 0,
      end: end,
    ).animate(CurvedAnimation(
      parent: _lotteryController,
      curve: Curves.easeOutCubic,
    ));

    //从动画的起始位置开始，避免上次动画的状态影响新的抽奖！ 0.5是中间开始播放
    // 等价于
    // _lotteryController.reset();
    // _lotteryController.forward();
    _lotteryController
        .forward(from: 0)
        .then((value) => setState(() => num = targetIndex));
  }

  @override
  void dispose() {
    _controller.dispose();
    _lotteryController.dispose();
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
            AnimatedBuilder(
              animation: _animation, // 使用曲线动画
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_animation.value * 100), // 垂直移动效果
                  child: Transform.scale(
                    scale: 1.0 + _scaleAnimation.value * 0.3, // 放大效果
                    child: Transform.rotate(
                      angle:
                          _rotateAnimation.value * 2 * 3.14159, // 旋转效果 (360度)
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

            // 圆形布局的8个旋转组件
            SizedBox(
              width: 200,
              height: 200,
              child: AnimatedBuilder(
                animation: _lotteryController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _lotteryRotation.value, // 整体旋转
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 中心点
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // 生成随机抽奖结果
                              _generateRandomLottery();
                            },
                            child: const Center(
                              child: Text(
                                "点击抽奖",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 8个围绕中心点的组件
                        ...List.generate(8, (index) {
                          // 调整角度，让奖品1在正上方（12点钟方向）
                          double angle = (index * 2 * pi) / 8; // 减去90度让第一个在正上方
                          double radius = 80; // 半径
                          double x =
                              100 + radius * cos(angle) - 25; // 减去组件宽度的一半
                          double y =
                              100 + radius * sin(angle) - 15; // 减去组件高度的一半

                          return Positioned(
                            left: x,
                            top: y,
                            child: Transform.rotate(
                              // angle: angle /*+ pi / 2*/, //垂直显示的
                              angle: angle + pi / 2, //围绕中心是平行的
                              child: Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "奖品${index + 1}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (num > 0)
              Text("中奖号码是：$num",
                  style: const TextStyle(fontSize: 20, color: Colors.red))
          ],
        ),
      ),
    );
  }
}
