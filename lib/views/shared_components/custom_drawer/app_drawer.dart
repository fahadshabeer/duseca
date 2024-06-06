import 'package:duseca_task/controllers/static_controllers/static_controllers.dart';
import 'package:duseca_task/utils/app_icons/app_icons.dart';
import 'package:duseca_task/utils/colors/app_colors.dart';
import 'package:duseca_task/utils/nav_utils/navigation_helper.dart';
import 'package:duseca_task/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_app_drawer_tile.dart';
import 'drawer_bottom_widget.dart';

class AppDrawer extends StatefulWidget {

  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int selected=2;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.scaffoldColor,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 30.sp, top: 20.sp),
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                child: SvgPicture.asset(AppIcons.logo),
              ),
            ),
            CustomAppDrawerTile(
              icon: AppIcons.dashboard,
              iconColor: selected == 0 ? Colors.blue : null,
              title: 'Overview',
              onTap: () {
                selected=0;
                if(mounted)setState(() {});
                StaticControllers.pageController.jumpToPage(0);
                StaticControllers.sliderDrawerKey.currentState?.closeSlider();
              },
              color: selected == 0
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
                icon: AppIcons.cart,
                iconColor: selected == 1 ? Colors.blue : null,
                title: 'E-Commerce',
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                color: selected == 1
                    ? const Color(0xff1a8eff1).withOpacity(0.10)
                    : Colors.transparent,
                leadingWidget: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.sp,
                  color: Colors.grey,
                )),
            CustomAppDrawerTile(
              icon: AppIcons.calendar,
              iconColor: selected == 2 ? Colors.blue : null,
              title: 'Calender',
              onTap: () {
                selected=2;
                if(mounted)setState(() {});
                StaticControllers.pageController.jumpToPage(2);
                StaticControllers.sliderDrawerKey.currentState?.closeSlider();
              },
              color: selected == 2
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
                icon: AppIcons.mail,
                iconColor: selected == 3 ? Colors.blue : null,
                title: 'Mail',
                onTap: () {
                  setState(() {
                    selected = 3;
                  });
                },
                color: selected == 3
                    ? const Color(0xff1A8EFF).withOpacity(0.10)
                    : Colors.transparent,
                leadingWidget: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange,
                  ),
                  child: const Center(
                    child: Text(
                      '8',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            CustomAppDrawerTile(
              icon: AppIcons.chat,
              iconColor: selected == 4 ? Colors.blue : null,
              title: 'Chat',
              onTap: () {
                selected=4;
                if(mounted)setState(() {});
                StaticControllers.pageController.jumpToPage(4);
                StaticControllers.sliderDrawerKey.currentState?.closeSlider();
              },
              color: selected == 4
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
              icon: AppIcons.tasks,
              iconColor: selected == 5 ? Colors.blue : null,
              title: 'Tasks',
              onTap: () {
                setState(() {
                  selected = 5;
                });
              },
              color: selected == 5
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
              icon: AppIcons.projects,
              iconColor: selected == 6 ? Colors.blue : null,
              title: 'Projects',
              onTap: () {
                setState(() {
                  selected = 6;
                });
              },
              color: selected == 6
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
              icon: AppIcons.fileManager,
              iconColor: selected == 7 ? Colors.blue : null,
              title: 'File Manager',
              onTap: () {
                setState(() {
                  selected = 7;
                });
              },
              color: selected == 7
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
              icon: AppIcons.notes,
              iconColor: selected == 8 ? Colors.blue : null,
              title: 'Notes',
              onTap: () {
                setState(() {
                  selected = 8;
                });
              },
              color: selected == 8
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            CustomAppDrawerTile(
              icon: AppIcons.contact,
              iconColor: selected == 9 ? Colors.blue : null,
              title: 'Contact',
              onTap: () {
                setState(() {
                  selected = 9;
                });
              },
              color: selected == 9
                  ? const Color(0xff1A8EFF).withOpacity(0.10)
                  : Colors.transparent,
            ),
            const DrawerBottomWidget(),
          ],
        ),
      ),
    );
  }
}
