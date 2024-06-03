import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekDropDown extends StatefulWidget {
  final Color? color;
  const WeekDropDown({Key? key, this.color}) : super(key: key);

  @override
  State<WeekDropDown> createState() => _WeekDropDownState();
}

class _WeekDropDownState extends State<WeekDropDown> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: widget.color??Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.4.sp,
            blurRadius: 3.sp
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.sp),
        child: DropdownButtonFormField(
            value: selected,

            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                constraints: BoxConstraints(minHeight: 30.h,)),
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text("This Week"),
              ),
              DropdownMenuItem(
                child: Text("Last Week"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("This Month"),
                value: 2,
              ),
            ],
            onChanged: (val) {
              selected = val ?? 0;
            }),
      ),
    );
  }
}
