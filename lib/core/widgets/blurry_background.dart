import 'dart:ui';
import 'package:e_commerce/core/theme/extensions/blurry_background_theme.dart';
import 'package:e_commerce/core/widgets/blurry_circle.dart';
import 'package:flutter/material.dart';

class BlurryBackground extends StatelessWidget {
  const BlurryBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final blobTheme = Theme.of(context).extension<BlurryBackgroundTheme>()!;
    final surface = Theme.of(context).colorScheme.surface;

    return Stack(
      children: [
        Container(color: surface),
        BlurryCircle(
          color: blobTheme.primaryBlob.withValues(alpha: 0.25),
          top: -180,
          left: -220,
          size: 420,
        ),
        BlurryCircle(
          color: blobTheme.secondaryBlob.withValues(alpha: 0.18),
          bottom: -200,
          right: -220,
          size: 420,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}
