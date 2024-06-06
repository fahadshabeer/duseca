import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors/app_colors.dart';

class SquareIconButton extends StatelessWidget {
  final String ico;
  final Function()? onTap;
  const SquareIconButton({super.key,required this.ico,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 43.sp,
      width: 43.sp,
      decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 1.sp,
                spreadRadius: 0.1
            )
          ]
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(ico,height: 25.sp,),
        ),
      ),
    );
  }
}
