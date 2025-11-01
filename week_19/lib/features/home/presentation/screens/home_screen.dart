import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/common/widgets/theme_bottom_sheet.dart';
import 'package:week_19/features/home/presentation/widgets/all_movies_list.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      appBar: AppBar(
        backgroundColor: context.customAppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Popular Movies',
          style: AppTextStyles.font18Bold.copyWith(
            color: context.customAppColors.grey900,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const ThemeBottomSheet(),
              );
            },
            icon: Icon(
              Icons.spa_rounded,
              size: 24.w,
              color: context.customAppColors.primary800,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: AllMoviesList(),
      ),
    );
  }
}
