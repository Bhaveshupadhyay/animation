import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/context_ext.dart';

class ClaimGiftCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  const ClaimGiftCard({super.key, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.hSm, horizontal: AppSpacing.wSm),
      decoration: BoxDecoration(
          color: AppColor.gray600,
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Row(
        spacing: AppSpacing.wSm,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.hXxs,horizontal: AppSpacing.wXxs,),
            decoration: BoxDecoration(
                color: AppColor.brown,
                borderRadius: BorderRadius.circular(10.r)
            ),
            child: Image.asset(
              icon,
              width: 30.w,
              height: 30.w,
            ),
          ),
          Expanded(
            child: Column(
              spacing: AppSpacing.hXs,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: context.textTheme().bodySmall?.copyWith(
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(description,
                    style: context.textTheme().labelSmall
                )
              ],
            ),
          ),

          Icon(Icons.arrow_forward_ios, size: 20.sp,),
        ],
      ),
    );
  }
}
