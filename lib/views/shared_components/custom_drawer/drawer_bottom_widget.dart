import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerBottomWidget extends StatelessWidget {
  const DrawerBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Calender',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                15.horizontalSpace,
                const Icon(
                  Icons.add,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 14.sp,
                    width: 14.sp,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                  15.horizontalSpace,
                  const Expanded(child: Text('Important')),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 14.sp,
                    width: 14.sp,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepOrange),
                  ),
                  15.horizontalSpace,
                  const Expanded(child: Text('Meeting')),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 14.sp,
                    width: 14.sp,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  ),
                  15.horizontalSpace,
                  const Expanded(child: Text('Event')),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 14.sp,
                    width: 14.sp,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  15.horizontalSpace,
                  const Expanded(child: Text('Work')),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 14.sp,
                    width: 14.sp,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  15.horizontalSpace,
                  const Expanded(child: Text('Other')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
