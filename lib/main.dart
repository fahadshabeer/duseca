import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:duseca_task/controllers/static_controllers/static_controllers.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/views/screens/chat_list_screen/chat_list_screen.dart';
import 'package:duseca_task/views/screens/chat_screen/chat_screen.dart';
import 'package:duseca_task/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:duseca_task/views/screens/home_screen/home_screen.dart';
import 'package:duseca_task/views/screens/root_screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void didChangeDependencies() async{
    StaticControllers.image=await load();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(

        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          fontFamily: 'Nunito',
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.scaffoldColor,
            surfaceTintColor: Colors.transparent
          )
        ),
        home: const RootScreen(),
      ),
    );
  }

  Future<ui.Image> load() async {
    final ByteData data = await rootBundle.load('assets/images/woman.png');
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}
