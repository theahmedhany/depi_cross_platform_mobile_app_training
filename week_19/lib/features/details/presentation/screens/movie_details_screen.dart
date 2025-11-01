import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/common/widgets/custom_loading.dart';
import 'package:week_19/core/helpers/extensions.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';
import 'package:week_19/features/details/data/models/movie_details_model.dart';
import 'package:week_19/features/details/presentation/logic/movie_details_cubit.dart';
import 'package:week_19/features/details/presentation/logic/movie_details_state.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState<MovieDetailsModel>>(
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: CustomLoading(size: 200)),
            loading: () => const Center(child: CustomLoading(size: 200)),
            success: (movieDetails, isFromCache) {
              return CustomScrollView(
                slivers: [
                  // App Bar with Poster
                  SliverAppBar(
                    expandedHeight: 350.h,
                    pinned: true,
                    backgroundColor: context.customAppColors.background,
                    surfaceTintColor: Colors.transparent,
                    leading: Container(
                      margin: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: context.customAppColors.background.withValues(
                          alpha: 0.9,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: context.customAppColors.black.withValues(
                              alpha: 0.3,
                            ),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () => context.pop(),
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
                          color: context.customAppColors.background.withValues(
                            alpha: 0.9,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: context.customAppColors.black.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
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
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Container(
                                color: context.customAppColors.primary300
                                    .withValues(alpha: 0.4),
                                child: const Center(
                                  child: CustomLoading(size: 150),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Container(
                                color: context.customAppColors.primary300
                                    .withValues(alpha: 0.4),
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
                                  context.customAppColors.black.withValues(
                                    alpha: 0.3,
                                  ),
                                  context.customAppColors.background.withValues(
                                    alpha: 0.95,
                                  ),
                                ],
                                stops: const [0.4, 0.75, 1.0],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(20),

                          // Title
                          Text(
                            movieDetails.title ?? 'N/A',
                            style: AppTextStyles.font12Bold.copyWith(
                              color: context.customAppColors.grey900,
                              height: 1.2,
                            ),
                          ),

                          verticalSpace(12),

                          // Rating and Language
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: context.customAppColors.warning500,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: context.customAppColors.warning500
                                          .withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      size: 18.w,
                                      color: context.customAppColors.white,
                                    ),
                                    horizontalSpace(4),
                                    Text(
                                      movieDetails.voteAverage != null
                                          ? movieDetails.voteAverage!
                                                .toStringAsFixed(1)
                                          : 'N/A',
                                      style: AppTextStyles.font14Bold.copyWith(
                                        color: context.customAppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: context.customAppColors.primary800
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: context.customAppColors.primary800
                                        .withValues(alpha: 0.3),
                                    width: 1.w,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.language_rounded,
                                      size: 16.w,
                                      color: context.customAppColors.primary800,
                                    ),
                                    horizontalSpace(6),
                                    Text(
                                      movieDetails.originalLanguage
                                              ?.toUpperCase() ??
                                          'N/A',
                                      style: AppTextStyles.font13Bold.copyWith(
                                        color:
                                            context.customAppColors.primary800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Genres
                          if (movieDetails.genres != null &&
                              movieDetails.genres!.isNotEmpty) ...[
                            verticalSpace(16),
                            Wrap(
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: movieDetails.genres!.map((genre) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        context.customAppColors.primary600,
                                        context.customAppColors.primary800,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    genre.name ?? 'N/A',
                                    style: AppTextStyles.font12Bold.copyWith(
                                      color: context.customAppColors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],

                          // Tagline
                          if (movieDetails.tagline != null &&
                              movieDetails.tagline!.isNotEmpty) ...[
                            verticalSpace(20),
                            Container(
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                color: context.customAppColors.primary300,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: context.customAppColors.primary400,
                                  width: 1.w,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.format_quote_rounded,
                                    color: context.customAppColors.primary600,
                                    size: 24.w,
                                  ),
                                  horizontalSpace(12),
                                  Expanded(
                                    child: Text(
                                      movieDetails.tagline!,
                                      style: AppTextStyles.font14Regular
                                          .copyWith(
                                            color: context
                                                .customAppColors
                                                .primary800,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          verticalSpace(24),

                          // Overview Section
                          Text(
                            'Overview',
                            style: AppTextStyles.font20Bold.copyWith(
                              color: context.customAppColors.grey900,
                            ),
                          ),
                          verticalSpace(12),
                          Text(
                            movieDetails.overview ?? 'N/A',
                            style: AppTextStyles.font14Regular.copyWith(
                              color: context.customAppColors.grey700,
                              height: 1.6,
                            ),
                          ),

                          verticalSpace(24),

                          // Movie Info Cards
                          Text(
                            'Movie Info',
                            style: AppTextStyles.font20Bold.copyWith(
                              color: context.customAppColors.grey900,
                            ),
                          ),
                          verticalSpace(12),
                          _buildInfoCard(
                            context,
                            icon: Icons.calendar_today_rounded,
                            label: 'Release Date',
                            value: movieDetails.releaseDate ?? 'N/A',
                          ),
                          verticalSpace(12),
                          _buildInfoCard(
                            context,
                            icon: Icons.access_time_rounded,
                            label: 'Runtime',
                            value: movieDetails.runtime != null
                                ? '${movieDetails.runtime} minutes'
                                : 'N/A',
                          ),
                          verticalSpace(12),
                          _buildInfoCard(
                            context,
                            icon: Icons.attach_money_rounded,
                            label: 'Budget',
                            value:
                                movieDetails.budget != null &&
                                    movieDetails.budget! > 0
                                ? '\$${_formatCurrency(movieDetails.budget!)}'
                                : 'N/A',
                          ),
                          verticalSpace(12),
                          _buildInfoCard(
                            context,
                            icon: Icons.trending_up_rounded,
                            label: 'Revenue',
                            value:
                                movieDetails.revenue != null &&
                                    movieDetails.revenue! > 0
                                ? '\$${_formatCurrency(movieDetails.revenue!)}'
                                : 'N/A',
                          ),
                          verticalSpace(12),
                          _buildInfoCard(
                            context,
                            icon: Icons.people_rounded,
                            label: 'Vote Count',
                            value: movieDetails.voteCount?.toString() ?? 'N/A',
                          ),

                          // Production Companies
                          if (movieDetails.productionCompanies != null &&
                              movieDetails.productionCompanies!.isNotEmpty) ...[
                            verticalSpace(24),
                            Text(
                              'Production Companies',
                              style: AppTextStyles.font20Bold.copyWith(
                                color: context.customAppColors.grey900,
                              ),
                            ),
                            verticalSpace(12),
                            ...movieDetails.productionCompanies!.map((company) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Container(
                                  padding: EdgeInsets.all(16.r),
                                  decoration: BoxDecoration(
                                    color: context.customAppColors.grey50,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: context.customAppColors.grey200,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.business_rounded,
                                        color:
                                            context.customAppColors.primary700,
                                        size: 24.w,
                                      ),
                                      horizontalSpace(12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              company.name ?? 'N/A',
                                              style: AppTextStyles
                                                  .font14SemiBold
                                                  .copyWith(
                                                    color: context
                                                        .customAppColors
                                                        .grey900,
                                                  ),
                                            ),
                                            if (company.originCountry != null)
                                              Text(
                                                company.originCountry!,
                                                style: AppTextStyles
                                                    .font12Regular
                                                    .copyWith(
                                                      color: context
                                                          .customAppColors
                                                          .grey600,
                                                    ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],

                          verticalSpace(32),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 64.w,
                    color: context.customAppColors.error500,
                  ),
                  verticalSpace(16),
                  Text(
                    error,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font16Regular.copyWith(
                      color: context.customAppColors.error500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.customAppColors.grey50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.customAppColors.grey200, width: 1.w),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.customAppColors.primary500,
                  context.customAppColors.primary700,
                ],
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: context.customAppColors.white, size: 20.w),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: context.customAppColors.grey600,
                  ),
                ),
                verticalSpace(4),
                Text(
                  value,
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: context.customAppColors.grey900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
