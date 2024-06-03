import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors/app_colors.dart';

class TotalAndGrowthRateWidget extends StatelessWidget {
  final String value;
  const TotalAndGrowthRateWidget({Key? key,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
        ),
        10.horizontalSpace,
        Container(
          width: 87.sp,
          height: 32.sp,
          decoration: BoxDecoration(
              color: AppColors.greenBg,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.trending_up,
                color: Colors.green,
                size: 16.sp,
              ),
              5.horizontalSpace,
              Text(
                "6.78%",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
              )
            ],
          ),
        )
      ],
    );
  }
}
