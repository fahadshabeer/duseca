import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/views/screens/dashboard_screen/custom_widgets/total_and_growth_rate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialCards extends StatelessWidget {
  const SocialCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.sp,
      child: ListView.separated(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.sp),
        itemBuilder: (context, index) {
          return Container(
            height: 175.sp,
            width: 300.w,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4.sp,
                      spreadRadius: 0.3.sp)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.facebook,
                    color: AppColors.blue,
                    size: 60.sp,
                  ),
                  title: const Text(
                    "mitchell.cooper",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Facebook"),
                ),
                const Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: TotalAndGrowthRateWidget(value: "353,49K")),
                    )),
                const Text(
                  "Followers",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            10.horizontalSpace,
      ),
    );
  }
}
