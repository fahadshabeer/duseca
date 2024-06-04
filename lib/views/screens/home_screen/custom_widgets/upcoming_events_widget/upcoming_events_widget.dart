import 'dart:math' as math;

import 'package:dotted_line/dotted_line.dart';
import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DesignLayout extends StatefulWidget {
  const DesignLayout({super.key});

  @override
  State<DesignLayout> createState() => _DesignLayoutState();
}

class _DesignLayoutState extends State<DesignLayout> {

  String time="07:00";
  List<String> _generateTimes(String startTime, int count, int interval) {
    List<String> times = [];
    DateTime startDateTime = DateTime.parse("2023-06-02 $startTime:00");
    for (int i = 0; i < count; i++) {
      times.add(
          "${startDateTime.hour.toString().padLeft(2, '0')}:${startDateTime.minute.toString().padLeft(2, '0')}");
      startDateTime = startDateTime.add(Duration(minutes: interval));
    }
    time=times.last;
    return times;
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, parentIndex) {
        if(parentIndex==0){
          time="07:00";
        }
        List<String> times = _generateTimes(time, 3, 30);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 130.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: times.map((e)=>
                        Text(
                          e,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                    ).toList(),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const DottedLine(dashColor: Colors.grey,),
                      Container(
                        height: 130.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 100.h,
                                width: 5.w,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "App Development",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "coding",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CircleAvatar(
                                        radius: 10.r,
                                        backgroundColor: Colors.grey.shade300,
                                        child: SvgPicture.asset(
                                          AppIcons.time,
                                          color: Colors.black,
                                          height: 12.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "8:30",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 40.h,
                                  child: ListView.builder(
                                      itemCount: 4,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            child: CircleAvatar(
                                              backgroundColor: Color(
                                                  (math.Random()
                                                      .nextDouble() *
                                                      0xFFFFFF)
                                                      .toInt())
                                                  .withOpacity(1.0),
                                            ));
                                      }),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const DottedLine(dashColor: Colors.grey,),
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }
}
