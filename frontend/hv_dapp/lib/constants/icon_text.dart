import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hv_dapp/constants/appstyle.dart';
import 'package:hv_dapp/constants/reusable_text.dart';


class IconAndText extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;
  final Color iconColor;
  const IconAndText(
      {super.key,
      required this.icon,
      required this.text,
      required this.size,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size:24.h,
        ),
        SizedBox(
          width: 4,
        ),
        ReusableText(text: text, style: appStyle(16, Colors.white, FontWeight.normal)),
      ],
    );
  }
}
