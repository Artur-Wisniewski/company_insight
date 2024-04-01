import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modal_card.dart';

class CapInfoModal extends StatelessWidget {
  const CapInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalCard(
      title: L10n.current.capCategories,
      icon: Icon(
        Icons.info_outline,
        color: Theme.of(context).colorScheme.secondary,
      ),
      content: Column(
        children: [
          _buildRow(context, L10n.current.megaCap, L10n.current.megaCapExplanation),
          Gaps.medium,
          _buildRow(context, L10n.current.largeCap, L10n.current.largeCapExplanation),
          Gaps.medium,
          _buildRow(context, L10n.current.midCap, L10n.current.midCapExplanation),
          Gaps.medium,
          _buildRow(context, L10n.current.smallCap, L10n.current.smallCapExplanation),
          Gaps.medium,
          _buildRow(context, L10n.current.microCap, L10n.current.microCapExplanation),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: Paddings.extraSmallAll,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadii.mediumAll,
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Gaps.small,
        Expanded(
          flex: 2,
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
