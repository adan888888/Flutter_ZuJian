import 'package:flutter/material.dart';

void main() {
  pint1('1', '2');
  pint2(s1: '1', s2: '2');
  pint3('1', '2', '3');
  pint3('1', '2');
  pint3('1');
}

//第一种 像java一样，必传.
void pint1(String s1, String s2) {
  print(s1 + s2);
}

//第二种 命名可选参数 使用{}.  (可通过 required 关键字标记为必传)
void pint2({String? s1, String? s2}) {
  print(s1! + s2!);
}

//第三种 位置可选参数  末尾的参数可以省略（不能省略前面的或者中间的）
void pint3([String? s1, String? s2, String? s3]) {
  print(s1! + s2! + s3!);
}

//上面的两种都可能给默认值
void pint4(String? s4,[String s1="我是默认值", String? s2, String? s3]) {
  print(s1! + s2! + s3!);
}