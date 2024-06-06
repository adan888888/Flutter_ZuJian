import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'charts_logic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('One', 35),
    _SalesData('Two', 28),
    _SalesData('Three', 34),
    _SalesData('Five', 32),
    _SalesData('Six', 40),
    _SalesData('Seven', 80)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
            axes: const [
              NumericAxis(
                name: '你好',
                opposedPosition: true, //右侧显示
                title: AxisTitle(text: '金额（元）'),
              )
            ],
            primaryXAxis: const CategoryAxis(
              //轴标题
              title: AxisTitle(text: ''),
              //轴标题置顶
              opposedPosition: false,
              //是否显示标题
              isVisible: true,
              labelRotation: -45,
            ),
            // Chart title
            title: const ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: const Legend(isVisible: false),
            // Enable tooltip 点了鼠标提示框
            tooltipBehavior: TooltipBehavior(enable: false),
            //系列；串联；连续
            series: <CartesianSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                //修饰数据点（显示圆圈）
                markerSettings: const MarkerSettings(
                    //不传显示空心
                    color: Colors.red,
                    isVisible: true),
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                //line color
                color: Colors.yellow,
                name: '卖',
                // Enable data label 点击显示弹框
                dataLabelSettings: const DataLabelSettings(isVisible: false),
              )
            ],
          ),
          /*  Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )*/
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
