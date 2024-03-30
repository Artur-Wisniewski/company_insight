import 'package:company_insight_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        height: 40,
        width: 40,
        SvgAssets.chevronLeft.path,
        semanticsLabel: SvgAssets.chevronLeft.semanticsLabel,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcATop,
        ),
      ),
    );
  }
}
