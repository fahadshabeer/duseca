import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatDateLabel extends StatelessWidget {
  final String date;

  ChatDateLabel({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.grey,
            ),
          ),
          30.horizontalSpace,
          const Text("Today, 10 June",style: TextStyle(color: Colors.grey),),
          30.horizontalSpace,
          Expanded(
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}