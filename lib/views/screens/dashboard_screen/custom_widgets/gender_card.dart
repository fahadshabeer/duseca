import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';


class GenderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Gender', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 10.h),
            SizedBox(height: 200.h,child: GenderChart()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGenderColumn('Male', '352k', Colors.blue),
                _buildGenderColumn('Female', '834k', Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderColumn(String label, String count, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 16.sp)),
        Text(count, style: TextStyle(fontSize: 22.sp, color: color)),
      ],
    );
  }
}

class GenderChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.yellow,
            value: 58,
            title: '58%',
            radius: 60,
            titleStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: Colors.purple,
            value: 42,
            title: '42%',
            radius: 60,
            titleStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
        centerSpaceRadius: 50,
        sectionsSpace: 0,
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;

  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
