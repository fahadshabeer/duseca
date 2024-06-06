import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextMessageSender extends StatelessWidget {
  final bool isSameUserMessage;
  final String? mentionedUser;
  final bool imageIncluded;

  const TextMessageSender(
      {super.key, this.mentionedUser,this.imageIncluded=false ,this.isSameUserMessage = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: !isSameUserMessage ? 10.sp : 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!isSameUserMessage)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "10:49pm",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 10.sp),
                          ),
                          10.horizontalSpace,
                          const Text(
                            "Jacob Hawkin",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    5.verticalSpace,
                    Container(
                      margin: EdgeInsets.only(left: 40.sp),
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.sp),
                            topRight: Radius.circular(
                                isSameUserMessage ? 24.sp : 0.sp),
                            bottomRight: Radius.circular(24.sp),
                            bottomLeft: Radius.circular(24.sp),
                          )),
                      child: Text.rich(TextSpan(
                          text: mentionedUser == null ? "" : "$mentionedUser ",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    "Hi Jane! I’ve completed 16 of 20 problems so far",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal))
                          ])),
                    )
                  ],
                ),
              ),
              5.horizontalSpace,
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
            ],
          ),
          if(imageIncluded)
          Align(
            alignment: Alignment.centerRight,
              child: images())
        ],
      ),
    );
  }

  Widget images() {
    return Container(
      height: 133.sp,
      width: 197.sp,
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      margin: EdgeInsets.only(
        right: 30.sp
      ),
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.sp),
                  child: Image.asset(
                    "assets/images/dummy_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              5.verticalSpace,
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.sp),
                  child: Image.asset(
                    "assets/images/dummy_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          5.horizontalSpace,
          Expanded(
            child: IntrinsicHeight(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.sp),
                child: Image.asset(
                  "assets/images/dummy_image.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
