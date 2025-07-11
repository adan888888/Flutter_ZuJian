class RectangleX {
  double _width = 0; // 私有字段
  double height = 0;

  double get width => this._width; //变量使用下划线，使外界无法直接用，必须使用get,set方法
  set width(double d) {
    this._width = d;
  }

  // 计算属性：面积
  double get area => width * height;
}
