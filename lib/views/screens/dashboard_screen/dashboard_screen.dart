import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_widgets/activity_card.dart';
import 'custom_widgets/follower_card.dart';
import 'custom_widgets/gender_card.dart';
import 'custom_widgets/overview_header.dart';
import 'custom_widgets/statistics_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            OverviewHeader(),
            SizedBox(height: 10.h),
            FollowersCard(),
            SizedBox(height: 10.h),
            GenderCard(),
            SizedBox(height: 10.h),
            ActivityCard(),
            SizedBox(height: 10.h),
            StatisticsCard(),
          ],
        ),
      ),
    );
  }
}