
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../shared_components/sqaure_icon_button.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius: BorderRadius.circular(14.sp),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 0.2.sp,
                      blurRadius: 1.sp)
                ]),
            child: Row(
              children: [
                ClipOval(
                  child: SvgPicture.asset(AppIcons.avatar),
                ),
                5.horizontalSpace,
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),

                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    ),
                  ),
                ),
                5.horizontalSpace,
                SquareIconButton(
                  ico: AppIcons.send,
                  onTap: () {},
                )
              ],
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                SquareIconButton(
                  ico: AppIcons.smile,
                  onTap: () {},
                ),
                5.horizontalSpace,
                SquareIconButton(
                  ico: AppIcons.attachments,
                  onTap: () {},
                ),
                5.horizontalSpace,
                SquareIconButton(
                  ico: AppIcons.image,
                  onTap: () {},
                )
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
