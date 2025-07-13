main() {
  // 使用
  final obj = MyClass.fromJson({'value': 42});

  // 使用
  final config = AppConfig(); // 每次获取的都是同一个实例
}

///1.工厂构造函数
class MyClass {
  // 普通构造函数（必须初始化所有 final 字段）
  const MyClass(this.value);

  // 工厂构造函数（1.可以有条件地返回对象（可以设置任何想传的参数-(Map<String, dynamic> json)） 2.命名构造方法前面的关键字
  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(json['value'] as int);
  }

  final int value;
}

///2.单例模式
class AppConfig {
  AppConfig._internal(); // 私有构造函数
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance; //工厂构造必须在类的内部实例化（可以是自身的实例，也可以是子类的实例）

  // 配置数据
  final String apiUrl = 'https://api.example.com';
}


/*
*
1。不能使用 this 引用
  工厂构造函数不能直接访问 this，因为实例可能还未创建。
2。必须有返回值
  工厂构造函数必须返回一个对象（或 null，如果是可空类型）。
3。私有构造函数配合使用
  常见的模式是使用私有构造函数（如 ClassName._internal()）配合工厂构造函数，控制实例的创建方式。
* */