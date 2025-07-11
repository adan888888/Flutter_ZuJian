import 'package:untitled/dart%E8%AF%AD%E6%B3%95/get_set%E6%96%B9%E6%B3%95/rectangle.dart';

main() {
  //使用get set 就是让外界不能直接访问，做一层封装
  final rect = RectangleX();
  // rect._width=2; //这里要注意在同一个文件里的话，还是可以直接防问私有属性的
  rect.width = 2;
  rect.height = 4;
  print(rect.area);
}
