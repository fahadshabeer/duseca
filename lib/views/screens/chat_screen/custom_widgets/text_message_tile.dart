import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextMessageTile extends StatelessWidget {
  final bool isSameUserMessage;
  final String? mentionedUser;

  const TextMessageTile(
      {super.key, this.mentionedUser, this.isSameUserMessage = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: !isSameUserMessage ? 10.sp : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !isSameUserMessage
              ? ClipOval(
                  child: SvgPicture.asset(
                    AppIcons.avatar,
                    height: 30.sp,
                    width: 30.sp,
                  ),
                )
              : SizedBox(
                  height: 30.sp,
                  width: 30.sp,
                ),
          5.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isSameUserMessage)
                  Row(
                    children: [
                      const Text(
                        "Jacob Hawkin",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      10.horizontalSpace,
                      Text(
                        "10:49pm",
                        style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                      ),
                    ],
                  ),
                5.verticalSpace,
                Container(
                  margin: EdgeInsets.only(right: 40.sp),
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(isSameUserMessage ? 24.sp : 0.sp),
                        topRight: Radius.circular(24.sp),
                        bottomRight: Radius.circular(24.sp),
                        bottomLeft: Radius.circular(24.sp),
                      )),
                  child: Text.rich(TextSpan(
                      text: mentionedUser == null ? "" : "$mentionedUser ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "Hi Jane! I’ve completed 16 of 20 problems so far",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ])),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
