import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/views/screens/chat_list_screen/custom_widgets/all_chats.dart';
import 'package:duseca_task/views/screens/chat_list_screen/custom_widgets/chat_tile.dart';
import 'package:duseca_task/views/screens/chat_list_screen/custom_widgets/pinned_chats.dart';
import 'package:duseca_task/views/screens/chat_list_screen/custom_widgets/search_bar.dart';
import 'package:duseca_task/views/shared_components/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.sp),
              children: [
                Text('PINNED',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
                const PinnedChats(),
                SizedBox(height: 16.h),
                Text('ALL MESSAGES',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
                SizedBox(height: 8.h),
                const AllChats(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
