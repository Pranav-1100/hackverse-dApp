import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hv_dapp/constants/appstyle.dart';
import 'package:hv_dapp/constants/constants.dart';
import 'package:hv_dapp/constants/icon_text.dart';
import 'package:hv_dapp/constants/reusable_text.dart';


class AppColumn extends StatelessWidget {
  final String text;
  final String location;
  final String date;
  final String type;
  const AppColumn({super.key, required this.text, required this.location, required this.date, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(text: text, style: appStyle(20,kOffWhite, FontWeight.bold),),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            ReusableText(
              text: location,
              style: appStyle(16,kGray, FontWeight.normal),
            ),
            SizedBox(width: 10.w),
            ReusableText(
              text: type,
              style: appStyle(16,kGray, FontWeight.normal),
            ),
          ],
        ),
       // SizedBox(height: 5.h),
        IconAndText(
            icon: Icons.location_on,
            text: location,
            size: 24.h,
            iconColor: kCyan),
            SizedBox(height: 10.h),
        IconAndText(
            icon: Icons.timer_outlined,
            text: date,
            size: 24.h,
            iconColor: Colors.red),
      ],
    );
  }
}
