import 'package:duseca_task/views/screens/dashboard_screen/custom_widgets/social_cards.dart';
import 'package:duseca_task/views/shared_components/custom_appBar.dart';
import 'package:duseca_task/views/shared_components/custom_drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../controllers/static_controllers/static_controllers.dart';
import 'custom_widgets/activity_card.dart';
import 'custom_widgets/follower_card.dart';
import 'custom_widgets/gender_card.dart';
import 'custom_widgets/overview_header.dart';
import 'custom_widgets/statistics_card.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppbar(
        navKey: StaticControllers.sliderDrawerKey,
      ),
      body: ListView(
        children: [
          10.verticalSpace,
          OverviewHeader(),
          10.verticalSpace,
          const SocialCards(),
          10.verticalSpace,
          const FollowersCard(),
          SizedBox(height: 10.h),
          GenderCard(),
          SizedBox(height: 10.h),
          ActivityCard(),
          SizedBox(height: 10.h),
          StatisticsCard(),
        ],
      ),
    );
  }
}