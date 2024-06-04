import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onSearchSubmitted;
  const CustomSearchBar({super.key, this.onSearchSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.sp,
      decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300))
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          prefixIcon: SizedBox(
              width: 30.sp,
              child: Center(
                  child: SvgPicture.asset(AppIcons.search))),
        ),
      ),
    );
  }
}
