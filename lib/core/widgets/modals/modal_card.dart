import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/backgrounds/glass_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class ModalCard extends StatelessWidget {
  const ModalCard({
    super.key,
    required this.content,
    required this.title,
    required this.icon,
  });

  final Widget content;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      onTap: context.pop,
      child: Center(
        child: Container(
          margin: Paddings.mediumAll,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadii.mediumAll,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gaps.medium,
                  Flexible(
                    child: Row(
                      children: [
                        icon,
                        Gaps.small,
                        Flexible(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: context.pop,
                    padding: Paddings.mediumAll,
                    icon: Icon(
                      Icons.close_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: Paddings.mediumAll,
                child: content,
              ),
            ],
          ),
        ),
      ).animate().slideY(end: 0, begin: 0.1, duration: Durations.short4, curve: Curves.easeInOut),
    );
  }
}
