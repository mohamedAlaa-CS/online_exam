import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam/core/theming/colors.dart';

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    super.key,
    required this.isActive,
    required this.imagePath,
  });
  final bool isActive;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.blue10 : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SvgPicture.asset(
        imagePath,
        height: 24.h,
        width: 24.w,
        colorFilter: ColorFilter.mode(
          isActive ? AppColors.primary : AppColors.black30,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
