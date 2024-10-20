import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/theming/colors.dart';

class MainBackButton extends StatelessWidget {
  const MainBackButton({super.key, this.color = Colors.black});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? InkWell(
            onTap: () {
              context.pop();
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 12.w,
                top: 8.h,
                bottom: 8.h,
                end: 4.w,
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
                size: 26,
              ),
            ),
          )
        : const SizedBox();
  }
}
