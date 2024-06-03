import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';


class GenderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 10.h),
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