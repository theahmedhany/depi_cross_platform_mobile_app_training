import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/common/widgets/custom_loading.dart';
import 'package:week_19/features/home/data/models/all_movies_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class AllMoviesCard extends StatelessWidget {
  const AllMoviesCard({super.key, required this.movie, required this.onTap});

  final MovieModel movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: context.customAppColors.grey50,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: context.customAppColors.grey100,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: context.customAppColors.grey200,
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Movie Poster
            Container(
              width: 120.w,
              margin: EdgeInsets.all(12.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Container(
                      decoration: BoxDecoration(
                        color: context.customAppColors.primary300.withValues(
                          alpha: 0.4,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: context.customAppColors.grey100,
                          width: 1.w,
                        ),
                      ),
                      child: const Center(child: CustomLoading(size: 40)),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      decoration: BoxDecoration(
                        color: context.customAppColors.primary300.withValues(
                          alpha: 0.4,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: context.customAppColors.grey100,
                          width: 1.w,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.movie_outlined,
                          size: 48.w,
                          color: context.customAppColors.grey400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Movie Info
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.title ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.font16SemiBold.copyWith(
                        color: context.customAppColors.grey900,
                        height: 1.3,
                      ),
                    ),
                    verticalSpace(8),
                    if (movie.overview != null && movie.overview!.isNotEmpty)
                      Text(
                        movie.overview!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font12Regular.copyWith(
                          color: context.customAppColors.grey600,
                          height: 1.4,
                        ),
                      ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 18.w,
                          color: context.customAppColors.warning500,
                        ),
                        horizontalSpace(4),
                        Text(
                          movie.voteAverage != null
                              ? movie.voteAverage!.toStringAsFixed(1)
                              : 'N/A',
                          style: AppTextStyles.font14SemiBold.copyWith(
                            color: context.customAppColors.grey800,
                          ),
                        ),
                        horizontalSpace(12),
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 16.w,
                          color: context.customAppColors.primary700,
                        ),
                        horizontalSpace(4),
                        Expanded(
                          child: Text(
                            movie.releaseDate ?? 'N/A',
                            style: AppTextStyles.font12Regular.copyWith(
                              color: context.customAppColors.grey600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
