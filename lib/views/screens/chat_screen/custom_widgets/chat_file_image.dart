import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/colors/app_colors.dart';

class ChatFileMessage extends StatelessWidget {
  final String sender;
  final String fileName;
  final String fileSize;
  final String time;
  final bool isSender;

  const ChatFileMessage({
    super.key,
    required this.sender,
    required this.fileName,
    required this.fileSize,
    required this.time,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender) ...[
            ClipOval(
              child: SvgPicture.asset(AppIcons.avatar),
            ),
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(sender,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    10.horizontalSpace,
                    Text("11:55",
                        style: TextStyle(
                            fontSize: 12.sp,color: Colors.grey)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                      color: isSender ? AppColors.blue : Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft:
                        Radius.circular(  0.sp),
                        topRight: Radius.circular(24.sp),
                        bottomRight: Radius.circular(24.sp),
                        bottomLeft: Radius.circular(24.sp),
                      )

                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.pdf,
                        width: 24.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fileName,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(fileSize,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey)),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        AppIcons.download,
                        width: 24.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}