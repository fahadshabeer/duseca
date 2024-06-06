import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/utils/custom_avatar_utils.dart';
import 'package:duseca_task/views/screens/chat_screen/custom_widgets/text_message_sender.dart';
import 'package:duseca_task/views/screens/chat_screen/custom_widgets/text_message_tile.dart';
import 'package:duseca_task/views/shared_components/custom_appBar.dart';
import 'package:duseca_task/views/shared_components/custom_icon_button.dart';
import 'package:duseca_task/views/shared_components/sqaure_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controllers/static_controllers/static_controllers.dart';
import 'custom_widgets/chat_date_label.dart';
import 'custom_widgets/chat_file_image.dart';
import 'custom_widgets/chat_input_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        navKey: StaticControllers.sliderDrawerKey,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (canPop){
          StaticControllers.pageController.jumpToPage(4);
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colors.grey.shade300, width: 1.sp))),
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, size: 24.sp),
                  onPressed: () {
                    StaticControllers.pageController.jumpToPage(4);
                  },
                ),
                titleSpacing: 0,
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: CustomAvatarUtils.getAlphAvatar('Design Team'),
                  ),
                  title: Text('Design Team', style: TextStyle(fontSize: 18.sp)),
                  subtitle: Text('6 Members, 3 Online',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                ),
                actions: [
                  const SquareIconButton(ico: AppIcons.more),
                  10.horizontalSpace,
                ],
              ),
            ),
            Expanded(child: ChatList()),
            ChatInputField(),
          ],
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      reverse: true,
      children: [
        const TextMessageTile(),
        const TextMessageTile(
          isSameUserMessage: true,
        ),
        const TextMessageSender(),
        const TextMessageSender(
          isSameUserMessage: true,
          imageIncluded: true,
        ),
        10.verticalSpace,
        ChatDateLabel(date: 'Today, 10 June'),
        const TextMessageSender(
          mentionedUser: "@John",
        ),
        const ChatFileMessage(
            sender: "John Doe",
            fileName: "example.pdf",
            fileSize: "14.3kb",
            time: "12:33am",
            isSender: false)
      ].reversed.toList(),
    );
  }
}






