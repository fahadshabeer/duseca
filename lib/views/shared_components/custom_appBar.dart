import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<SliderDrawerState>? navKey;
  const CustomAppbar({super.key,this.navKey});

  @override
  Size get preferredSize => Size(1.sw, 60.sp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 5.sp,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              if(navKey!=null){
                navKey?.currentState?.openSlider();
              }
            },
            icon: SvgPicture.asset(AppIcons.overview),
          );
        }
      ),
      actions: [
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(AppIcons.search,height: 20.sp,)
        ),
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(AppIcons.settings,height: 30.sp,)
        ),
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(AppIcons.notification,height: 30.sp,)
        ),
        const VerticalDivider(),
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(AppIcons.avatar,height: 30.sp,)
        )
      ],
    );
  }
}
