import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/views/screens/chat_list_screen/chat_list_screen.dart';
import 'package:duseca_task/views/screens/chat_screen/chat_screen.dart';
import 'package:duseca_task/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:duseca_task/views/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.scaffoldColor,
            surfaceTintColor: Colors.transparent
          )
        ),
        home: ChatScreen(),
      ),
    );
  }
}
