import 'dart:convert';

class ABean {
  var name;
  var age;

  ABean.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    age = map['age'];
  }
}

void main() {
  print("----------------------------List和json互转-------------------------");
  var j = ["张三", "张三", "张三", "李四"];
  print(j is List);
  print('${j}');
  var jsonString = jsonEncode(j);//对象list转Json
  print(jsonString);
  var decode = jsonDecode(jsonString);
  print(decode is List);
  print("-------------------------------Map和json互转------------------------------------");
  var j2 = {'name': "张三", "age": "20"};
  var j3 = {'name': "张三", "age": "20"};
  print(j2);
  print(jsonEncode(j2)); //map 转成json输出
  print(jsonDecode(jsonEncode(j2)) is Map<String,dynamic>);
  print("-------------------------------------------------------------------");
  var A = ABean.fromJson(j2);
  //print('${jsonEncode(A)}'); //出错，只有list ,map才能直接输出
  //print(A as Map<String, dynamic>); //出错，只有list ,map才能直接输出
  print(A.name);
  print("---------------------------参数----------------------------------------");
  print(f1("a")); //1
  print(f2("a")); //2
  print(f3("a")); //3  []可选参数可传可不传 f3(String a, [b=0, c])还可以加默认值
  print(f4("a", c: 3, b: 2)); //4 {}命名参数,直接通过名字来赋值，也是可传可不伟
  print(f5("a", c: 3, b: 2, d: '必填的命名参数')); //5 可行参数，如果加了，类型约束，就变成了，必填参数
  print(f6("a", c: 3, b: 2, d: (m) {
    print(m);
    return [1, 2];
  })); //5 传方法
  print("---------------------------List.from,toList----------------------------------------");
  print(List.from(j));
  var d = j2 is Map ? [j2] : j2; //把map变成List
  print((d as List).length); //d as List 转成List才能获取长度
  var x = j.map((e) => {"--${e}00"}).toList();
  print(x); //.map是把j里面的每个值拿出来做一次修改，进行封装，可变成其它组件
  print('${x[0] == x[0]}');

  print("---------------------------级联操作符..----------------------------------------");
  AA aa = AA()..s = "sss"; //两个..就相当于操作对象aa里面的值
  print(aa.s);

  print("---------------------------对象比较..单例----------------------------------------");
  AA? aaa1 = AA();
  AA aaa2 = AA();
  print(aaa1 == aaa2);
  BB bb1 = BB();
  BB bb2 = BB();
  print(BB._() == BB._()); //这里还是能访问的到，是因为是在一个文件里
  print(bb1 == bb2);

  print("---------------------------?问号的使用  ?  ??  !   ??=----------------------------------------");
  aaa1 = null;
  print(aaa1?.s?.length); //单问号.是非空判断，如果aaa1为空，就返回null,不会往下执行

  String? s;
  print(s ?? "cccc"); //如果s为空，就返回"cccc"，不为空则返回 他自己（就像一个默认值一样，为空给一个默认值）

  aaa1 ??= AA(); //两个问号= 如果aaa1是空，则将AA()值赋给aaa1。 如果不为空，则返回aaa1
  print(aaa1);

  List<String>? ls = ["1", "2", "3"];
  print(ls.map((e) => "AA$e").toList());
  ls = null;
  print('${ls?.length}'); //!空检查操作符，会抛出异常
  print('${ls?.isNotEmpty}');
  // print('${ls!.length}'); //!空检查操作符，会抛出异常

  print("--- 数组----");
  AAA? aaa3 = AAA("", "", [AAA("", null, [])]);
  var v1 = aaa3.list?[0].bb; //这里必须要加?

  String? title = "dummy";
  String newTitle = title!; //承诺title不为空
  print(newTitle);

  print("---------------------------late----------------------------------------");
  late String ttilex; //late 声明变量，告诉编译器，在使用前一定会初始化
  ttilex = "dummy";
  print(title);
}

f1(String a) {
  return a;
}

f2(a) {
  return a;
}

f3(String a, [b, c]) {
  return "${a} ${b} ${c} ";
}

f4(String a, {b, c = 5}) {
  return "${a} ${b} ${c} ";
}

f5(String a, {b, c = 5, required String d}) {
  return "${a} ${b} ${c} ${d} ";
}

f6(String a, {b, c = 5, required Function d}) {
  return "${a} ${b} ${c} ${d('成功')[0]} "; //d()执行传过来的方法
}

class AA {
  String? s;
}

class BB {
  /// 单例对象
  static BB? _socket;

  /// _下划线私有构造方法，防止外部直接调用
  BB._();

  /// 获取单例内部方法 ，只有工厂构造方法才有return返回值
  /* factory BB() {
    // 只能有一个实例
    _socket ??= BB._();
    return _socket!;
  }*/

  //简化写法
  /* factory BB() {
    return _socket ??= BB._();
  }*/

  // 再简化
  factory BB() => _socket ??= BB._();
}

class AAA {
  String aa = "";
  String? bb;
  List<AAA>? list;

  AAA(this.aa, this.bb, this.list);
}
