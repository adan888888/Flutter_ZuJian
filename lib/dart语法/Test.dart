import 'dart:math';

//1.定义函数类型
typedef int Compare(Object a, Object b);

class SortedCollection {
  Compare compare;

  SortedCollection(this.compare);
}

int sort(Object a, Object b) => 0;

main() {
  var sortedCollection = SortedCollection(sort);
  print(sortedCollection.compare is Function);
  print(sortedCollection.compare is Compare);
}
