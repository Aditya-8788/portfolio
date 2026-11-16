import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/anchors.dart';
import '../../domain/entities/summary_info.dart';
import '../bloc/bloc.dart';
import '../theme/app_theme.dart';
import '../widgets/grad_text.dart';
import '../widgets/hover_card.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_heading.dart';

/// Professional summary drawn from the resume, with quick-glance stats.
class SummarySection extends StatelessWidget {
  const SummarySection({
    super.key,
    required this.anchors,
    required this.controller,
  });

  final Anchors anchors;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final padding = contentPaddingOf(context);
    final summary = context.read<SummaryBloc>().state.summary;

    return Padding(
      key: anchors.summary,
      padding: EdgeInsets.fromLTRB(padding, 80, padding, 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScrollReveal(
                controller: controller,
                child: const SectionHeading(
                  order: '01',
                  label: 'Summary',
                  title: 'Professional Summary',
                ),
              ),
              const SizedBox(height: 44),
              ScrollReveal(
                controller: controller,
                delay: const Duration(milliseconds: 100),
                child: HoverCard(
                  padding: const EdgeInsets.all(28),
                  child: _SummaryText(summary: summary),
                ),
              ),
              const SizedBox(height: 24),
              ScrollReveal(
                controller: controller,
                delay: const Duration(milliseconds: 200),
                child: _StatsGrid(stats: summary.stats),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryText extends StatelessWidget {
  const _SummaryText({required this.summary});

  final SummaryInfo summary;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          summary.headline,
          style: textTheme.headlineSmall!.copyWith(
            fontFamily: AppText.displayFont,
          ),
        ),
        const SizedBox(height: 18),
        for (var i = 0; i < summary.paragraphs.length; i++) ...[
          if (i > 0) const SizedBox(height: 14),
          Text(
            summary.paragraphs[i],
            style: textTheme.bodyLarge!.copyWith(
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ],
      ],
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.stats});

  final List<SummaryStat> stats;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 16.0;
        final columns = constraints.maxWidth > 820 ? 4 : 2;
        final width =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final stat in stats)
              SizedBox(
                width: width,
                child: HoverCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: GradientText(
                          stat.value,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontFamily: AppText.displayFont),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        stat.label,
                        style: AppText.mono(12, letterSpacing: 0.6),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
