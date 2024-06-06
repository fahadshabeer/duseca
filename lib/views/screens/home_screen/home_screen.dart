import 'package:duseca_task/controllers/static_controllers/static_controllers.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/views/screens/home_screen/custom_widgets/month_week_day_widget.dart';
import 'package:duseca_task/views/shared_components/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared_components/custom_drawer/app_drawer.dart';
import 'custom_widgets/calendar_widget.dart';
import 'custom_widgets/upcoming_events_widget/upcoming_events_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        navKey: StaticControllers.sliderDrawerKey,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CalendarWidget(),
                SizedBox(height: 16.h),
                Text('Upcoming', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          DesignLayout(),
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
