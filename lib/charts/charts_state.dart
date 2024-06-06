class ChartsState {
  ChartsState() {
    ///Initialize variables
  }
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
