import 'package:flutter/material.dart';

/*
*定义了一个名为 CanFly 的 mixin，其中包含一个 fly 方法。
*创建了一个 Bird 类，使用 with 关键字将 CanFly mixin 混入到 Bird 类中，这样 Bird 类就拥有了 fly 方法。
**/

///mixin 不能单独实例化，它只是一种代码复用的方式，需要通过 with 关键字混入到类中使用。

// 定义一个 mixin
mixin  CanFly {
  void fly() {
    print('I can fly!');
  }
}

// 使用 mixin
class Bird  with CanFly {
  // Bird 类现在拥有了 fly 方法
}

void main() {
  Bird bird = Bird();
  bird.fly(); // 输出: I can fly!
}


//////////////////////////////// on关键字
// 定义一个基类
class Animal {
  void eat() {
    print('I can eat.');
  }
}

// 定义一个 mixin，并使用 on 关键字限制只能应用于 Animal 或其子类
mixin CanSwim on Animal {
  void swim() {
    eat(); // 可以调用 Animal 类的方法
    print('I can swim!');
  }
}

// 创建一个类继承自 Animal 并混入 CanSwim mixin
class Fish extends Animal with CanSwim {
  // Fish 类现在拥有了 eat 和 swim 方法
}

//不是Animal子类的就不能混入CanSwim
// class Fish1  with CanSwim {
//   // Fish 类现在拥有了 eat 和 swim 方法
// }