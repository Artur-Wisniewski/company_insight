import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'modal_card.dart';

class InitialModal extends StatelessWidget {
  const InitialModal({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalCard(
      title: L10n.current.firstTimeInTheApp,
      onClose: () => context.pop(false),
      icon: Icon(
        Icons.waving_hand,
        color: Theme.of(context).colorScheme.secondary,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(L10n.current.theApp,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
          Text(L10n.current.designedToHelp, style: Theme.of(context).textTheme.bodyMedium),
          Gaps.medium,
          Text(L10n.current.wouldYouLikeToFindOutHow,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
          Text(L10n.current.letMeIntroduceForYouBriefPrompts, style: Theme.of(context).textTheme.bodyMedium),
          Gaps.large,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => context.pop(false),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Text(L10n.current.skip),
              ),
              Gaps.small,
              ElevatedButton(
                onPressed: () => context.pop(true),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Text(L10n.current.startTutorial),
              ),
            ],
          )
        ],
      ),
    );
  }
}
