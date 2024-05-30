import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

//倒计时
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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CounterDownPage(),
        // child: DJS(),
      ),
    );
  }
}

//倒计时1
class DJS extends StatefulWidget {
  const DJS({super.key});

  @override
  State<DJS> createState() => _DJSState();
}

class _DJSState extends State<DJS> {
  Timer? _timer;
  int _currentSeconds = 60;

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Text("$_currentSeconds", style: const TextStyle(fontSize: 80));
  }

  startTimer() {
    if (_timer != null && _currentSeconds != 0) {
      print('onTap 取消');
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1), //1,时间间隔
      (Timer timer) {
        //2,事件处理回调
        if (_currentSeconds == 0) {
          if (_timer!.isActive) {
            timer.cancel();
            _timer = null;
          }
        } else {
          setState(() {
            _currentSeconds--;
          });
        }
      },
    );
  }
}

//倒计时2
class CounterDownPage extends StatefulWidget {
  @override
  _CounterDownPageState createState() => _CounterDownPageState();
}

class _CounterDownPageState extends State<CounterDownPage> {
  // 用来在布局中显示相应的剩余时间
  String remainTimeStr = '';
  Timer? _timer;

  //倒计时
  void startCountDown(int time) {
    // 重新计时的时候要把之前的清除掉
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer?.cancel();
        _timer = null;
      }
    }
    if (time <= 0) {
      return;
    }
    var countTime = time;
    const repeatPeriod = const Duration(seconds: 1);
    _timer = Timer.periodic(repeatPeriod, (Timer? timer) {
      if (countTime <= 0) {
        timer?.cancel();
        timer = null;
        //待付款倒计时结束，可以在这里做相应的操作
        return;
      }
      countTime--;
      //外面传进来的单位是秒，所以需要根据总秒数，计算小时，分钟，秒
      int hour = (countTime ~/ 3600) % 24; //如果不止24小时的就不用%24
      int minute = countTime % 3600 ~/ 60;
      int second = countTime % 60;
      var str = '';
      if (hour > 0) {
        str = str + hour.toString() + ':';
      }
      if (minute / 10 < 1) {
        //当只有个位数时，给前面加“0”，实现效果：“:01”,":02"
        str = str + '0' + minute.toString() + ":";
      } else {
        str = str + minute.toString() + ":";
      }
      if (second / 10 < 1) {
        str = str + '0' + second.toString();
      } else {
        str = str + second.toString();
      }
      setState(() {
        remainTimeStr = str;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //开始倒计时，这里传入的是秒数
    startCountDown(5000);
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer?.cancel();
        _timer = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("倒计时"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "剩余",
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(255, 111, 50, 1), fontWeight: FontWeight.bold),
            ),
            Text(
              remainTimeStr.length > 0 ? remainTimeStr : "--",
              style: const TextStyle(fontSize: 18, color: Color.fromRGBO(255, 111, 50, 1), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
