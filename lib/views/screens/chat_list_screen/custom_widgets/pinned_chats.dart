import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/views/screens/chat_list_screen/custom_widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinnedChats extends StatelessWidget {
  const PinnedChats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      separatorBuilder: (context, index) => 7.verticalSpace,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ChatTile(
        name: 'Jane Wilson',
        avatar: index == 2 ? AppIcons.avatar : null,
        lastMessage: 'Hi! How are you, Steve? 😊',
        time: index < 1
            ? '3'
            : index > 1
            ? '5'
            : "",
        isSelected: index == 1,
        isUnread: true,
      ),
    );
  }
}
