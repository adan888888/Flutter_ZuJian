import 'package:flutter/material.dart';

//是 Dart 2.7 引入的一个强大特性，它允许你为现有的类添加新的方法，而无需修改这些类的源代码。这在你无法直接修改类定义，但又希望为其添加一些实用功能时非常有用
/*
* 增强数据处理能力：为数据模型类添加扩展函数，实现一些常用的数据处理方法，提高代码的复用性。
* */

// 定义一个扩展函数，为 String 类添加一个 toIntOrNull 方法
extension S1 on String {
  int? toIntOrNull() {
    return int.tryParse(this);
  }
}

void main() {
  //1
  String numberString = '123x';
  int? number = numberString.toIntOrNull();
  if (number != null) {
    print('转换后的整数: $number');
  } else {
    print('无法转换为整数');
  }

  //2为 List 类添加扩展函数
  List<int> numbers = [1, 2, 3, 4, 5];
  int sum = numbers.sum();
  print('列表元素的和: $sum');
}

// 定义一个扩展函数，为 List 类添加一个 sum 方法，用于计算列表中所有元素的和
extension ListExtension<T extends num> on List<T> {
    T sum() {
      //reduce 方法接受一个回调函数作为参数，这个回调函数有两个参数：value 和 element。
      //value 是累积的结果，element 是列表中的当前元素。
      return reduce((value, element) => (value + element) as T);
    }
}
