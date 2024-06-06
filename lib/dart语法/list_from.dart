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

  print(8~/4);
}
