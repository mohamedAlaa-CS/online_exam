import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';

class ImageProfileAndEditIcon extends StatelessWidget {
  const ImageProfileAndEditIcon({
    super.key,
    required this.imageUrl,
    required this.deitIconOnTap,
  });
  final String imageUrl;
  final VoidCallback deitIconOnTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          maxRadius: 41.h,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: deitIconOnTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                color: AppColors.blue40,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: AppColors.white,
                size: 16.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
