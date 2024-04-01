import 'package:company_insight_app/core/widgets/modals/initial_modal.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

import 'cap_info_modal.dart';
import 'financial_health_info_modal.dart';

class Modals {
  static void showCapInfo(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => const CapInfoModal(),
    );
  }

  static void showNetIncomeMarginInfo(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => FinancialHealthInfoModal(
        title: L10n.current.netIncomeMargin,
        descriptionContent: L10n.current.netIncomeHint,
        formulaContent: L10n.current.netIncomeFormula,
      ),
    );
  }

  static void showCurrentRatioInfo(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => FinancialHealthInfoModal(
        title: L10n.current.currentRatio,
        descriptionContent: L10n.current.currentRatioHint,
        formulaContent: L10n.current.currentRatioFormula,
      ),
    );
  }

  static void showDebtToEquityRatio(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => FinancialHealthInfoModal(
        title: L10n.current.debtToEquityRatio,
        descriptionContent: L10n.current.debtToEquityRatioHint,
        formulaContent: L10n.current.debtToEquityRatioFormula,
      ),
    );
  }

  static Future<bool?> showInitialModal(BuildContext context) async {
    return await showDialog(
        context: context, useSafeArea: false, barrierDismissible: false, builder: (context) => const InitialModal());
  }
}
