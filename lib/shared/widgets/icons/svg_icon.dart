import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.asset, {
    this.color,
    this.size,
    this.blendMode = BlendMode.srcIn,
    super.key,
  });

  final String asset;
  final Color? color;
  final double? size;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconTheme = IconTheme.of(context);
    final iconSize = size ?? iconTheme.size ?? 24;
    final iconColor = color ?? iconTheme.color ?? theme.colorScheme.onSurface;
    return SvgPicture.asset(
      asset,
      height: iconSize,
      colorFilter: ColorFilter.mode(iconColor, blendMode),
    );
  }
}
