import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppDrawerTile extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final String title;
  final Color color;
  final Function() onTap;

  final Widget? leadingWidget;

  const CustomAppDrawerTile(
      {super.key,
      required this.icon,
      this.leadingWidget,
      required this.title,
      required this.onTap,
      required this.color,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        height: 56.h,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16.sp)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14.sp),
          child: Row(
            children: [
              15.horizontalSpace,
              SvgPicture.asset(
                icon,
                width: 18,
                height: 18,
                colorFilter:iconColor!=null? ColorFilter.mode(
                    iconColor ?? Colors.black, BlendMode.srcIn):null,
              ),
              10.horizontalSpace,
              Expanded(
                  child: Text(
                title,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1A1926)),
              )),
              if (leadingWidget != null) leadingWidget!,
              10.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
