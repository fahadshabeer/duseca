import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/views/screens/home_screen/custom_widgets/month_week_day_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_widgets/calendar_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Expanded(child: MonthWeekDayWidget()),
                    10.horizontalSpace,
                    MaterialButton(
                      color: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.sp)
                      ),
                      height: 48.h,
                      minWidth: 48.h,
                      onPressed: (){},
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                const CalendarWidget(),
                SizedBox(height: 16.h),
                Text('Upcoming', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                EventCard(
                  time: '07:00',
                  title: 'Brandbook and Guidebook',
                  subtitle: 'Design',
                  startTime: '07:00',
                  participants: [1, 2, 3, 4],
                ),
                EventCard(
                  time: '08:30',
                  title: 'App Development',
                  subtitle: 'Coding',
                  startTime: '08:30',
                  participants: [1, 2, 3],
                ),
                EventCard(
                  time: '10:00',
                  title: 'Landing Page',
                  subtitle: 'Meeting',
                  startTime: '10:00',
                  participants: [1, 2, 3, 4],
                ),
                EventCard(
                  time: '11:30',
                  title: 'Project "Rocket"',
                  subtitle: 'Meeting',
                  startTime: '11:30',
                  participants: [1, 2, 3, 4],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class EventCard extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final String startTime;
  final List<int> participants;

  EventCard({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.startTime,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.h),
                  Text(subtitle, style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16.sp, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Text(startTime, style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: participants
                        .map((e) => Padding(
                              padding: EdgeInsets.only(right: 4.w),
                              child: CircleAvatar(
                                radius: 12.r,
                                backgroundImage: AssetImage('assets/avatar_$e.png'),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
