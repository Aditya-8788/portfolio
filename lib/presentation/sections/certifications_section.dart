import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/anchors.dart';
import '../../domain/entities/certificate_gallery_item.dart';
import '../bloc/bloc.dart';
import '../theme/app_theme.dart';
import '../widgets/hover_card.dart';
import '../widgets/scroll_reveal.dart';
import '../widgets/section_heading.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({
    super.key,
    required this.anchors,
    required this.controller,
  });

  final Anchors anchors;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final padding = contentPaddingOf(context);

    return Container(
      key: anchors.certifications,
      padding: EdgeInsets.fromLTRB(padding, 96, padding, 96),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScrollReveal(
                controller: controller,
                child: const SectionHeading(
                  order: '06',
                  label: 'Achievements',
                  title: 'Achievements & Certifications',
                ),
              ),
              const SizedBox(height: 44),
              _HighlightsGrid(controller: controller),
              const SizedBox(height: 48),
              _CertificateGallery(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class _CertificateGallery extends StatelessWidget {
  const _CertificateGallery({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final certificateGallery = context
        .read<CertificationsBloc>()
        .state
        .certificateGallery;
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 20.0;
        final crossAxisCount = constraints.maxWidth > 800
            ? 3
            : constraints.maxWidth > 500
            ? 2
            : 1;
        final itemWidth =
            (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
            crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (var i = 0; i < certificateGallery.length; i++)
              SizedBox(
                width: itemWidth,
                child: ScrollReveal(
                  controller: controller,
                  delay: Duration(milliseconds: 80 * i),
                  child: _CertificateCard(
                    item: certificateGallery[i],
                    onTap: () => showCertificateLightbox(
                      context,
                      certificateGallery[i].imagePath,
                      certificateGallery[i].title,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _CertificateCard extends StatelessWidget {
  const _CertificateCard({required this.item, required this.onTap});

  final CertificateGalleryItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isAchievement = item.category == 'Achievement';
    final tagColor = isAchievement ? AppColors.purple : AppColors.cyan;

    return HoverCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                color: AppColors.surfaceAlt,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _CertificatePlaceholder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: AppText.displayFont,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: tagColor.withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    item.category,
                    style: AppText.mono(
                      10.5,
                      color: tagColor,
                      weight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificatePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceAlt,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyan.withValues(alpha: 0.2),
                  blurRadius: 20,
                  spreadRadius: -4,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Certificate coming soon',
            style: AppText.mono(11, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

class _LightboxOverlay extends StatefulWidget {
  const _LightboxOverlay({required this.imagePath, required this.title});

  final String imagePath;
  final String title;

  @override
  State<_LightboxOverlay> createState() => _LightboxOverlayState();
}

class _LightboxOverlayState extends State<_LightboxOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    await _controller.reverse();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: GestureDetector(
        onTap: _close,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: Colors.black.withValues(alpha: 0.88),
          child: Stack(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (_, _, _) =>
                                  _CertificatePlaceholder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontFamily: AppText.displayFont,
                                fontSize: 16,
                                color: AppColors.textPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                right: 24,
                child: GestureDetector(
                  onTap: _close,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surface.withValues(alpha: 0.85),
                      border: Border.all(color: AppColors.border),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.textPrimary,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCertificateLightbox(
  BuildContext context,
  String imagePath,
  String title,
) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.transparent,
    transitionDuration: Duration.zero,
    pageBuilder: (_, _, _) =>
        _LightboxOverlay(imagePath: imagePath, title: title),
  );
}

/// Resume achievements & certifications shown as two text cards above the
/// certificate gallery.
class _HighlightsGrid extends StatelessWidget {
  const _HighlightsGrid({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final state = context.read<CertificationsBloc>().state;

    final achievements = _HighlightCard(
      title: 'Achievements & Competitions',
      icon: Icons.emoji_events_rounded,
      accent: AppColors.purple,
      rows: [
        for (final a in state.achievements)
          (icon: a.icon, title: a.title, sub: null),
      ],
    );
    final certifications = _HighlightCard(
      title: 'Certifications',
      icon: Icons.workspace_premium_rounded,
      accent: AppColors.cyan,
      rows: [
        for (final c in state.certifications)
          (icon: c.icon, title: c.title, sub: c.issuer),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 820) {
          return Column(
            children: [
              ScrollReveal(controller: controller, child: achievements),
              const SizedBox(height: 20),
              ScrollReveal(
                controller: controller,
                delay: const Duration(milliseconds: 100),
                child: certifications,
              ),
            ],
          );
        }
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: ScrollReveal(
                  controller: controller,
                  child: achievements,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: ScrollReveal(
                  controller: controller,
                  delay: const Duration(milliseconds: 100),
                  child: certifications,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({
    required this.title,
    required this.icon,
    required this.accent,
    required this.rows,
  });

  final String title;
  final IconData icon;
  final Color accent;
  final List<({IconData icon, String title, String? sub})> rows;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return HoverCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accent, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleLarge!.copyWith(
                    fontFamily: AppText.displayFont,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: accent.withValues(alpha: 0.3)),
                    ),
                    alignment: Alignment.center,
                    child: Icon(row.icon, size: 17, color: accent),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          row.title,
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (row.sub != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            row.sub!,
                            style: AppText.mono(11.5, letterSpacing: 0.4),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
