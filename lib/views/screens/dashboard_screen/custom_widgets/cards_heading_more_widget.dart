import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_icons/app_icons.dart';

class HeadingAndMoreWidget extends StatelessWidget {
  final String heading;
  final Function()? onMoreTapped;
  const HeadingAndMoreWidget({super.key,required this.heading, this.onMoreTapped});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(heading, style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600))),
        if(onMoreTapped!=null)
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(AppIcons.more)),
      ],
    );
  }
}
