import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/common/widgets/custom_loading.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class MoviePosterHeader extends StatelessWidget {
  const MoviePosterHeader({
    super.key,
    required this.imageUrl,
    required this.onBackPressed,
    required this.onFavoritePressed,
  });

  final String imageUrl;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.h,
      pinned: true,
      backgroundColor: context.customAppColors.background,
      surfaceTintColor: Colors.transparent,
      leading: Container(
        margin: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: context.customAppColors.background.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.customAppColors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: IconButton(
          onPressed: onBackPressed,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.customAppColors.grey900,
            size: 20.w,
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: context.customAppColors.background.withValues(alpha: 0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: context.customAppColors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: IconButton(
            onPressed: onFavoritePressed,
            icon: Icon(
              Icons.favorite_border_rounded,
              color: context.customAppColors.error700,
              size: 24.w,
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  color: context.customAppColors.primary300.withValues(
                    alpha: 0.4,
                  ),
                  child: const Center(child: CustomLoading(size: 150)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  color: context.customAppColors.primary300.withValues(
                    alpha: 0.4,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.movie_outlined,
                      size: 100.w,
                      color: context.customAppColors.grey400,
                    ),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    context.customAppColors.black.withValues(alpha: 0.3),
                    context.customAppColors.background.withValues(alpha: 0.95),
                  ],
                  stops: const [0.4, 0.75, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
