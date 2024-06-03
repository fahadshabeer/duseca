import 'package:duseca_task/views/screens/dashboard_screen/custom_widgets/total_and_growth_rate_widget.dart';
import 'package:duseca_task/views/shared_components/week_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

import 'cards_heading_more_widget.dart';

class StatisticsCard extends StatelessWidget {
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
          const HeadingAndMoreWidget(heading: "Statistics"),
          10.verticalSpace,
          WeekDropDown(),
          10.verticalSpace,
           Row(
            children: [
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      const Text("Share",style: TextStyle(color: Colors.grey),),
                       10.verticalSpace,
                       TotalAndGrowthRateWidget(value: "145,56"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Likes",style: TextStyle(color: Colors.grey),),
                      Text("1,467",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 32.sp),),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Container(
            height: 200.h,
            child: BarChart(

              BarChartData(
                maxY: 20,
                gridData: const FlGridData(
                  drawVerticalLine: false
                ),
                borderData: FlBorderData(
                  border: const Border(
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  )
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(width: 16,toY: 15.65, color: Colors.blue),
                      BarChartRodData(width: 16,toY: 6.55, color: Colors.yellow),
                      BarChartRodData(width: 16,toY: 9.40, color: Colors.orange),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(width: 16,toY: 10.42, color: Colors.purple),
                      BarChartRodData(width: 16,toY: 5.60, color: Colors.yellow),
                      BarChartRodData(width: 16,toY: 4.20, color: Colors.orange),
                    ],
                  ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (val, meta) => SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(weekDays[val.floor()])))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
