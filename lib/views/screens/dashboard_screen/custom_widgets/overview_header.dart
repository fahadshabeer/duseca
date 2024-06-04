import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/views/shared_components/sqaure_icon_button.dart';
import 'package:duseca_task/views/shared_components/week_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class OverviewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SquareIconButton(
           ico: AppIcons.download,
          onTap: (){},
        ),
          10.horizontalSpace,
          Expanded(child: WeekDropDown(color: AppColors.scaffoldColor,)),
        ],
      ),
    );
  }
}