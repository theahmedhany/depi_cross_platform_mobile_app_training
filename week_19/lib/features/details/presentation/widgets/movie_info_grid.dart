import 'package:flutter/material.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/features/details/data/models/movie_details_model.dart';
import 'package:week_19/features/details/presentation/widgets/movie_info_card.dart';

class MovieInfoGrid extends StatelessWidget {
  const MovieInfoGrid({super.key, required this.movieDetails});

  final MovieDetailsModel movieDetails;

  String _formatRuntime(int? minutes) {
    if (minutes == null) return 'N/A';
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) {
      return '${hours}h ${mins}m';
    }
    return '${mins}m';
  }

  String _formatRevenue(int? revenue) {
    if (revenue == null || revenue == 0) return 'N/A';
    if (revenue >= 1000000000) {
      return '\$${(revenue / 1000000000).toStringAsFixed(1)}B';
    } else if (revenue >= 1000000) {
      return '\$${(revenue / 1000000).toStringAsFixed(1)}M';
    } else if (revenue >= 1000) {
      return '\$${(revenue / 1000).toStringAsFixed(1)}K';
    }
    return '\$$revenue';
  }

  String _formatBudget(int? budget) {
    if (budget == null || budget == 0) return 'N/A';
    if (budget >= 1000000000) {
      return '\$${(budget / 1000000000).toStringAsFixed(1)}B';
    } else if (budget >= 1000000) {
      return '\$${(budget / 1000000).toStringAsFixed(1)}M';
    } else if (budget >= 1000) {
      return '\$${(budget / 1000).toStringAsFixed(1)}K';
    }
    return '\$$budget';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: MovieInfoCard(
                icon: Icons.access_time_rounded,
                label: 'Duration',
                value: _formatRuntime(movieDetails.runtime),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: MovieInfoCard(
                icon: Icons.calendar_today_rounded,
                label: 'Release',
                value: movieDetails.releaseDate ?? 'N/A',
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: MovieInfoCard(
                icon: Icons.language_rounded,
                label: 'Language',
                value: movieDetails.spokenLanguages?.isNotEmpty == true
                    ? movieDetails.spokenLanguages!.first.englishName ?? 'N/A'
                    : 'N/A',
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: MovieInfoCard(
                icon: Icons.info_outline_rounded,
                label: 'Status',
                value: movieDetails.status ?? 'N/A',
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: MovieInfoCard(
                icon: Icons.attach_money_rounded,
                label: 'Budget',
                value: _formatBudget(movieDetails.budget),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: MovieInfoCard(
                icon: Icons.trending_up_rounded,
                label: 'Revenue',
                value: _formatRevenue(movieDetails.revenue),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: MovieInfoCard(
                icon: Icons.public_rounded,
                label: 'Country',
                value: movieDetails.productionCountries?.isNotEmpty == true
                    ? movieDetails.productionCountries!.first.name ?? 'N/A'
                    : 'N/A',
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: MovieInfoCard(
                icon: Icons.star_border_rounded,
                label: 'Popularity',
                value: movieDetails.popularity != null
                    ? movieDetails.popularity!.toStringAsFixed(1)
                    : 'N/A',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
