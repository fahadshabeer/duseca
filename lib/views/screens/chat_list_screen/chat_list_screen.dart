
import 'package:duseca_task/views/screens/chat_list_screen/custom_widgets/chat_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        actions: [

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              children: [
                _buildSearchBar(),
                SizedBox(height: 16.h),
                Text('PINNED', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.grey)),
                _buildPinnedChats(),
                SizedBox(height: 16.h),
                Text('ALL MESSAGES', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.grey)),
                SizedBox(height: 8.h),
                Expanded(child: _buildAllMessages()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, size: 28.sp),
        Row(
          children: [
            Icon(Icons.search, size: 28.sp),
            SizedBox(width: 16.w),
            Icon(Icons.settings, size: 28.sp),
            SizedBox(width: 16.w),
            Icon(Icons.notifications, size: 28.sp),
            SizedBox(width: 16.w),
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage('assets/avatar_user.png'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 24.sp, color: Colors.grey),
          SizedBox(width: 8.w),
          Text('Search...', style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildPinnedChats() {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      separatorBuilder: (context,index)=>7.verticalSpace,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index)=> ChatTile(
        name: 'Jane Wilson',
        lastMessage: 'Hi! How are you, Steve? 😊',
        time: index<1?'3': index>1?'5':"",
        isSelected: index==1,

        isUnread: true,
      ),
    );
  }

  Widget _buildAllMessages() {
    return ListView.separated(
      itemCount: 6,
      shrinkWrap: true,
      separatorBuilder: (context,index)=>7.verticalSpace,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index)=>const ChatTile(
        name: 'Jane Wilson',
        lastMessage: 'Hi! How are you, Steve? 😊',
        time: '',
        isUnread: false,
      ),
    );
  }
}


