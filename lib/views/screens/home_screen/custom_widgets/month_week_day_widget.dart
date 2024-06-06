import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthWeekDayWidget extends StatelessWidget {
  final Function(CalendarFormat)  onChanged;
  final CalendarFormat currentFormat;
  const MonthWeekDayWidget({super.key,required this.onChanged,required this.currentFormat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.monthsWeekUnselected,
          borderRadius: BorderRadius.circular(14.sp)),
      height: 48.h,
      child: Row(
        children: [
          _tabItem("Month", CalendarFormat.month),
          _tabItem("2 Weeks", CalendarFormat.twoWeeks),
          _tabItem("Week", CalendarFormat.week),
        ],
      ),
    );
  }

  Widget _tabItem(String title, CalendarFormat calendarFormat) {
    var isSelected = (calendarFormat == currentFormat);
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
            color: isSelected? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12.sp),
            boxShadow: !isSelected
                ? []
                : [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2.sp,
                        blurRadius: 5.sp)
                  ]),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: (){
            onChanged(calendarFormat);
          },
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
          )),
        ),
      ),
    );
  }
}
