import 'package:flutter/material.dart';

import 'cap_info_modal.dart';

class Modals {
  static void showCapInfo(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => const CapInfoModal(),
    );
  }
}
