main() {
  //1.整型 int
  int i = 10;
  //2.浮点型 float
  double d = 10.45;
  d = 10;
  print('$i \n$d');

  //3.运算符  +-*/%
  var c = i + d;
  print('$c');
  print(0 % 3);
  print(1 % 3);
  print(2 % 3);
  print(3 % 3);
  print(4 % 3);
  print(5 % 3);
  print(6 % 3);
  print(7 % 3);

  ///----------------------------------------------------------------4，布尔值
  bool? bb;
  print(bb); //默认是空
  bb = false;
  print('$bb');

  ///----------------------------------------------------------------4，条件运算
  var ccc = 123;
  var bbb = '123';
  if (ccc == bbb) { //dart中类型不会自动转换
    print('真');
  } else {
    print('假');
  }
}
