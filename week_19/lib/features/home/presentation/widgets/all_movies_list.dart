import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/common/widgets/custom_loading.dart';
import 'package:week_19/core/helpers/extensions.dart';
import 'package:week_19/core/routing/routes.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';
import 'package:week_19/features/home/data/models/all_movies_model.dart';
import 'package:week_19/features/home/presentation/logic/all_movies_cubit.dart';
import 'package:week_19/features/home/presentation/logic/all_movies_state.dart';
import 'package:week_19/features/home/presentation/widgets/all_movies_card.dart';

class AllMoviesList extends StatefulWidget {
  const AllMoviesList({super.key});

  @override
  State<AllMoviesList> createState() => _AllMoviesListState();
}

class _AllMoviesListState extends State<AllMoviesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AllMoviesCubit>().loadMoreMovies();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesCubit, AllMoviesState<AllMoviesModel>>(
      builder: (context, state) {
        return state.when(
          idle: () => const Center(child: CustomLoading(size: 200)),
          loading: () => const Center(child: CustomLoading(size: 200)),
          success: (allMovies, isFromCache) {
            return _buildMovieGrid(allMovies, showLoadingMore: false);
          },
          loadingMore: (allMovies) {
            return _buildMovieGrid(allMovies, showLoadingMore: true);
          },
          error: (error) => Center(
            child: Text(
              error,
              style: TextStyle(color: context.customAppColors.error500),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMovieGrid(
    AllMoviesModel allMovies, {
    required bool showLoadingMore,
  }) {
    final itemCount =
        (allMovies.results?.length ?? 0) + (showLoadingMore ? 1 : 0);

    return RefreshIndicator(
      onRefresh: () async {
        context.read<AllMoviesCubit>().emitGetAllMovies();
      },
      color: context.customAppColors.primary500,
      backgroundColor: context.customAppColors.background,
      child: ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 16.r, bottom: 24.r),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (showLoadingMore && index == allMovies.results!.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomLoading(size: 50),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AllMoviesCard(
              movie: allMovies.results![index],
              onTap: () {
                context.pushNamed(
                  Routes.movieDetailsScreen,
                  arguments: allMovies.results![index].id,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
