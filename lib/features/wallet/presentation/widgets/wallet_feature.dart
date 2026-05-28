import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/context_ext.dart';

class WalletFeature extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const WalletFeature({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.hSm, horizontal: AppSpacing.wSm),
      decoration: BoxDecoration(
          color: context.isLight()? AppColor.white3 : AppColor.gray500,
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Row(
        spacing: AppSpacing.wSm,
        children: [
          Container(
            padding: EdgeInsets.only(left: AppSpacing.wXs,right: AppSpacing.wXs, top: AppSpacing.hS),
            decoration: BoxDecoration(
                color: context.isLight()? AppColor.white : AppColor.gray700,
                borderRadius: BorderRadius.circular(20.r)
            ),
            child: Image.asset(
              icon,
              width: 45.w,
              height: 50.w,
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: context.textTheme().titleMedium?.copyWith(
                    fontWeight: FontWeight.w800
                  ),
                ),
                Text(description,
                  style: context.textTheme().bodySmall
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
