import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_tile.dart';

class AllChats extends StatelessWidget {
  const AllChats({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      itemCount: 6,
      shrinkWrap: true,
      separatorBuilder: (context, index) => 7.verticalSpace,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ChatTile(
        name: 'Jane Wilson',
        lastMessage: 'Hi! How are you, Steve? 😊',
        time: '',
        isUnread: false,
      ),
    );
  }
}
