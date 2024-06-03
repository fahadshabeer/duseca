import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthWeekDayWidget extends StatelessWidget {
  const MonthWeekDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.monthsWeekUnselected,
          borderRadius: BorderRadius.circular(14.sp)),
      height: 48.h,
      child: Row(
        children: [
          _tabItem("Month", 0, 0),
          _tabItem("Week", 1, 0),
          _tabItem("Day", 2, 0),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int id, int selected) {
    var isSelected = (id == selected);
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
            color: id == selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12.sp),
            boxShadow: !isSelected
                ? []
                : [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2.sp,
                        blurRadius: 5.sp)
                  ]),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
        )),
      ),
    );
  }
}
