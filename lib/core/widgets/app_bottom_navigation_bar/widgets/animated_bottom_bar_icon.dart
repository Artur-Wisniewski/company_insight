import 'package:company_insight_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedBottomBarIcon extends StatefulWidget {
  const AnimatedBottomBarIcon({
    super.key,
    required this.outlineIcon,
    required this.fillIcon,
    required this.isSelected,
    this.selectedColor,
    this.unselectedColor,
    this.size = 28.0,
  });

  final AssetInfo outlineIcon;
  final AssetInfo fillIcon;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double size;

  @override
  State<AnimatedBottomBarIcon> createState() => _AnimatedBottomBarIconState();
}

class _AnimatedBottomBarIconState extends State<AnimatedBottomBarIcon> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedBottomBarIcon oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      setState(() {
        isSelected = widget.isSelected;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    late final Color color;
    if (isSelected) {
      color = widget.selectedColor ?? Theme.of(context).iconTheme.color!;
    } else {
      color = widget.unselectedColor ?? Theme.of(context).unselectedWidgetColor;
    }

    late final Widget icon;
    if (isSelected) {
      icon = SvgPicture.asset(
        widget.fillIcon.path,
        key: const ValueKey<bool>(true),
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        width: widget.size,
        height: widget.size,
        semanticsLabel: widget.fillIcon.semanticsLabel,
      );
    } else {
      icon = SvgPicture.asset(
        widget.outlineIcon.path,
        key: const ValueKey<bool>(false),
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        width: widget.size,
        height: widget.size,
        semanticsLabel: widget.outlineIcon.semanticsLabel,
      );
    }

    return AnimatedSwitcher(
      duration: Durations.short4,
      child: icon,
    );
  }
}
