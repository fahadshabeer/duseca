import 'package:duseca_task/controllers/static_controllers/static_controllers.dart';
import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/utils/custom_avatar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTile extends StatelessWidget {
  final String? avatar;
  final String name;
  final String lastMessage;
  final String time;
  final bool isUnread;
  final bool isTyping;
  final int totalUnread;
  final bool isSelected;

  const ChatTile(
      {super.key,
      this.avatar,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.isUnread,
      this.isSelected = false,
      this.isTyping = false,
      this.totalUnread = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        StaticControllers.pageController.jumpToPage(5);
      },
      child: Container(
        height: 96.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : AppColors.chatTileColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black12, blurRadius: 4.r)]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            avatar == null
                ? Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient:
                            CustomAvatarUtils.generateRandomLinearGradient()),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${name.split(" ").first.characters.first}${name.split(" ").last.characters.first}"
                              .toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(AppIcons.avatar),
                  ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.h),
                  Text(lastMessage,
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey)),
                ],
              ),
            ),
            if (time.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(time,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
