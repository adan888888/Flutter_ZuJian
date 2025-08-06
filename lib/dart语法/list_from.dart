void main() {
  ///-------------------------------List.from=toList--------------------------------------
  var x = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var map = x.map((e) => "名字 $e");
  print('$map');
  print('${map.toList()}');
  var list = List<String>.from(map);
  print('$list');

  print('-------------------------------List.generate--------------------------------------');
  var list2 = List.generate(
      10, //生成数量
      (index) => "名字 $index"); //生成的值

  print(list2);

  print(8 ~/ 4); //相当于.toInt

  print('-------------------------------List.generate--------------------------------------');

  var list3 = List.generate(10, (index) => 1111).toList();
  for (var i = 9; i >= 0; i--) {
    list3[i] = i;
    print('$list3');
  }

  print('-------------------------------return,continue,break--------------------------------------');
  test();
  print('=>');

  print('------------------------------- in --------------------------------------');
  var t=getData();
  for (var value in t) {
    print("到达");
  }
}

getData() {
  var map = {'name': 'zhangsan', 'age': 18};
  return map;
}
test(){
  var list4 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  for (var i = 0; i < list4.length; i++) {
    // if (i == 3) {
    //   return;//return 本方法test（）都不会往下走了
    // }
    // if (i == 5) {
    //   continue; //continue结束本次运行，继续下次运行
    // }
    if (i == 7) {
      break;  //break 仅退出这个for循环
    }
    print(list4[i]);
  }
  print('=>');
}