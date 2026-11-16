import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/anchors.dart';
import '../../domain/entities/experience_item.dart';
import '../bloc/bloc.dart';
import '../theme/app_theme.dart';
import '../widgets/grad_text.dart';
import '../widgets/hover_card.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_heading.dart';
import '../widgets/tech_chip.dart';

/// Vertical timeline of professional experience.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
    required this.anchors,
    required this.controller,
  });

  final Anchors anchors;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final padding = contentPaddingOf(context);
    final items = context.read<ExperienceBloc>().state.experienceItems;

    return Padding(
      key: anchors.experience,
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
                  order: '02',
                  label: 'Experience',
                  title: 'Experience',
                ),
              ),
              const SizedBox(height: 44),
              for (var i = 0; i < items.length; i++)
                ScrollReveal(
                  controller: controller,
                  delay: Duration(milliseconds: 120 * i),
                  child: _TimelineEntry(
                    item: items[i],
                    isLast: i == items.length - 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({required this.item, required this.isLast});

  final ExperienceItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final mobile = deviceOf(context) == DeviceType.mobile;

    final card = Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: HoverCard(
        padding: const EdgeInsets.all(24),
        child: _Content(item: item),
      ),
    );

    if (mobile) return card;

    // A Stack (not IntrinsicHeight) sizes to the card, so wrapped tags never
    // overflow; the connector line is positioned against that height.
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: 27,
            top: 64,
            bottom: 8,
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.cyan.withValues(alpha: 0.6),
                    AppColors.border,
                  ],
                ),
              ),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _IconBox(icon: item.icon),
            const SizedBox(width: 22),
            Expanded(child: card),
          ],
        ),
      ],
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: -8,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mobile = deviceOf(context) == DeviceType.mobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mobile) ...[_IconBox(icon: item.icon), const SizedBox(height: 18)],
        Wrap(
          spacing: 12,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              item.role,
              style: textTheme.headlineSmall!.copyWith(
                fontFamily: AppText.displayFont,
              ),
            ),
            if (item.current)
              const TechChip('Current', dotColor: AppColors.statusGreen),
          ],
        ),
        const SizedBox(height: 8),
        GradientText(
          item.company,
          style: textTheme.titleLarge!.copyWith(
            fontFamily: AppText.displayFont,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 20,
          runSpacing: 8,
          children: [
            _Meta(icon: Icons.calendar_today_rounded, text: item.period),
            _Meta(icon: Icons.location_on_rounded, text: item.location),
          ],
        ),
        if (item.projects.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Projects:', style: AppText.mono(12, letterSpacing: 0.6)),
              for (final project in item.projects)
                TechChip(project, dotColor: AppColors.purple),
            ],
          ),
        ],
        const SizedBox(height: 16),
        for (final highlight in item.highlights)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '▸ ',
                  style: textTheme.bodyMedium!.copyWith(color: AppColors.cyan),
                ),
                Expanded(child: Text(highlight, style: textTheme.bodyMedium)),
              ],
            ),
          ),
        if (item.tags.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final tag in item.tags) TechChip(tag)],
          ),
        ],
      ],
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppColors.textMuted),
        const SizedBox(width: 8),
        Flexible(
          child: Text(text, style: AppText.mono(12, letterSpacing: 0.6)),
        ),
      ],
    );
  }
}
