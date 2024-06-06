import 'package:duseca_task/controllers/static_controllers/static_controllers.dart';
import 'package:duseca_task/views/screens/chat_list_screen/chat_list_screen.dart';
import 'package:duseca_task/views/screens/chat_screen/chat_screen.dart';
import 'package:duseca_task/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:duseca_task/views/screens/home_screen/home_screen.dart';
import 'package:duseca_task/views/shared_components/custom_drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
      key: StaticControllers.sliderDrawerKey,
      slider: const AppDrawer(),
      appBar: null,
      child: PageView(
        controller: StaticControllers.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DashboardScreen(),
          const SizedBox.shrink(),
          const HomeScreen(),
          const SizedBox.shrink(),
           ChatListScreen(),
           const ChatScreen(),
          const SizedBox.shrink(),
          const SizedBox.shrink(),
          const SizedBox.shrink(),
          const SizedBox.shrink(),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
