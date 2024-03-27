class Person {
  String? name; // 默认访问修饰符，默认为包内可见

  int? _age; // 私有成员，只能在当前文件中访问

  void sayHello() {
    print('Hello, $name!');
  }

  int _calculateAge() {
    // 私有方法，只能在当前文件中访问
    // ...
   return 0;
  }
}