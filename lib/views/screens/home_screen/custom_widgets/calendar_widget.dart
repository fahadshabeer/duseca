import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import 'month_week_day_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat calendarFormat=CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Expanded(child: MonthWeekDayWidget(
               currentFormat: calendarFormat,
               onChanged: (calendarFormat){
                 if(mounted){
                   setState(() {
                     this.calendarFormat=calendarFormat;
                   });
                 }
               },
             )
             ),
            10.horizontalSpace,
            MaterialButton(
              color: AppColors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.sp)
              ),
              height: 48.h,
              minWidth: 48.h,
              onPressed: (){},
              child: const Icon(Icons.add,color: Colors.white,),
            ),
          ],
        ),
        10.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.sp,
                    spreadRadius: 1.sp)
              ]),
          child: TableCalendar(
            rowHeight: 41.sp,
            availableGestures: AvailableGestures.none,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context,dt,dtt)=>Container(
                height: 41.sp,
                width: 41.sp,
                margin: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.sp)
                ),
                child: Center(
                  child:FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(dt.day.toString(),style: TextStyle(fontSize:14.sp),),
                  ),
                ),
              ),
              todayBuilder: (context,dt,dtt)=>Container(
                height: 41.sp,
                width: 41.sp,
                margin: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 1.sp,
                      spreadRadius: 0.1.sp
                    )
                  ]
                ),
                child: Center(
                  child:FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(dt.day.toString(),style: TextStyle(fontSize:14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
            ),
            headerStyle:
                const HeaderStyle(formatButtonVisible: false, titleCentered: true),
            calendarFormat: calendarFormat,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ),
      ],
    );
  }
}
