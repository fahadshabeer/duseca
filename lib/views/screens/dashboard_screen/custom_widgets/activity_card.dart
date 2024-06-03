import 'package:duseca_task/views/screens/dashboard_screen/custom_widgets/total_and_growth_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

import 'cards_heading_more_widget.dart';

class ActivityCard extends StatefulWidget {
  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  var weekDays = ["M", "T", "W", "T", "F", "S", "S"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.4.sp,
                blurRadius: 5.sp)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingAndMoreWidget(heading: "Activity", onMoreTapped: () {}),
          const TotalAndGrowthRateWidget(value: "145,567K"),
          10.verticalSpace,
          SizedBox(height: 10.h),
          SizedBox(
            height: 200.h,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true, drawVerticalLine: false),
                titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (val, meta) => SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(weekDays[val.floor()]))))),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 40,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 10),
                      FlSpot(1, 15),
                      FlSpot(2, 13),
                      FlSpot(3, 20),
                      FlSpot(4, 35),
                      FlSpot(5, 25),
                      FlSpot(6, 30),
                    ],
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 5,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
