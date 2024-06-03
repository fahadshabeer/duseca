import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Design Team', style: TextStyle(fontSize: 18.sp)),
            Text('6 Members, 3 Online', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatList()),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      children: [
        ChatMessage(
          sender: 'Jane Wilson',
          message: 'Hi Jacob and Brandon, any progress on the project? 😊',
          time: '10:43',
          isSender: false,
        ),
        ChatMessage(
          sender: 'Jacob Hawkins',
          message: 'Hi Jane! 🙌 Yes. I just finished developing the Chat template.',
          time: '10:47',
          isSender: true,
        ),
        ChatImageMessage(
          sender: 'Jacob Hawkins',
          images: ['assets/image1.png', 'assets/image2.png', 'assets/image3.png'],
          time: '10:47',
          isSender: true,
        ),
        ChatMessage(
          sender: 'Brandon Pena',
          message: 'Hi Jane! I’ve completed 16 of 20 problems so far.\nToday or tomorrow I think I’ll finish it 💪',
          time: '10:52',
          isSender: false,
        ),
        ChatDateLabel(date: 'Today, 10 June'),
        ChatMessage(
          sender: 'Jane Wilson',
          message: 'It looks amazing. The customer will be very satisfied. 😍',
          time: '09:15',
          isSender: false,
        ),
        ChatMessage(
          sender: 'Jacob Hawkins',
          message: '@Brandon, can you send me the Style Guide.',
          time: '11:48',
          isSender: true,
        ),
        ChatFileMessage(
          sender: 'Brandon Pena',
          fileName: 'Brand Styles Guide',
          fileSize: '570 KB',
          time: '11:50',
          isSender: false,
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isSender;

  ChatMessage({
    required this.sender,
    required this.message,
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
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(sender, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.blue.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(message, style: TextStyle(fontSize: 16.sp)),
                ),
                Text(time, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatImageMessage extends StatelessWidget {
  final String sender;
  final List<String> images;
  final String time;
  final bool isSender;

  ChatImageMessage({
    required this.sender,
    required this.images,
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
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(sender, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.blue.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: images.map((image) => Image.asset(image, width: 100.w, height: 100.h)).toList(),
                  ),
                ),
                Text(time, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatFileMessage extends StatelessWidget {
  final String sender;
  final String fileName;
  final String fileSize;
  final String time;
  final bool isSender;

  ChatFileMessage({
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
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(sender, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.blue.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.insert_drive_file, size: 24.sp, color: Colors.grey),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fileName, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                            Text(fileSize, style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Icon(Icons.download, size: 24.sp, color: Colors.grey),
                    ],
                  ),
                ),
                Text(time, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatDateLabel extends StatelessWidget {
  final String date;

  ChatDateLabel({required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(date, style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700)),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo, size: 24.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt, size: 24.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.insert_emoticon, size: 24.sp),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, size: 24.sp, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
