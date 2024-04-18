main() {
  ///--------------------------------字符串拼接
  String v1="aaaa";
  String v2="bbbb";
  print("$v1 $v2"); //单引号
  print('$v1 $v2'); //双引号
  print(v1+""+v2); //还可以用+号
  //多行可以用3引号
  String v3='''第一行
  第二行
  ''';
  print(v3);

  ///--------------------------------identical是否是一个对象
  final a = 100;
  const int b = 100;
  print('${identical(a, b)}  ${(a == b)}');

  ///--------------------------------
  final ax = DateTime.now(); //final是运行时常量
  const int bx = 100; //const是编译时常量
  print('${identical(ax, bx)}  ${(ax == bx)}'); //identical比较内存地址是否一样

  ///--------------------------------
  printPerson(
    name: 'John',
  );
  printMessage('message', 'msg');

  ///--------------------------------
  Person('john', 20);

  ///--------------------------------使用工厂函数创建对象
  var logger1 = Logger('Logger 1');
  var logger2 = Logger('Logger 2');
  print('测试${identical(logger1, logger2)}');
}

class XXX {
  final a = 100;
  String age = "json";
  static const int b = 100;
}

/**
 * 1.命名参数：
 */
void printPerson({String? name, int? age}) {
  print('Person: $name, $age years old');
}

/**
 * [] 要按顺序填写，不需要写名称
 */
void printMessage(String message, [String? prefix]) {
  if (prefix != null) {
    print('$prefix: $message');
  } else {
    print(message);
  }
}

/**
 * 构造函数
 */
class Person {
  String name;
  int? age;

  // 默认构造函数
  Person(this.name, this.age);

  // 命名构造函数
  Person.fromBirthYear(this.name, int birthYear) {
    age = DateTime.now().year - birthYear;
  }
}

/**
 * 工厂函数
 * 工厂函数通常用于创建单例对象或根据特定条件决定返回哪个对象。
 */
class Logger {
  String name;
  static Logger? _instance;

  // 私有构造函数
  Logger._internal(this.name);

  // 工厂函数
  factory Logger(String name) {
    _instance ??= Logger._internal(name);
    return _instance!;
  }
}
