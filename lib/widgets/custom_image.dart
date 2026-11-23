import 'package:flutter/material.dart';

/// Widget seguro para renderizar imagens de assets ou URLs
/// sem quebrar a tela se o arquivo local estiver ausente.
class CustomImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData placeholderIcon;

  const CustomImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholderIcon = Icons.image_outlined,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width ?? 80,
          height: height ?? 80,
          decoration: BoxDecoration(
            color: const Color(0xFF6D4BBC).withValues(alpha: 0.12),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF6D4BBC).withValues(alpha: 0.3)),
          ),
          child: Center(
            child: Icon(
              placeholderIcon,
              color: const Color(0xFF6D4BBC),
              size: (height != null && height! < 50) ? 24 : 36,
            ),
          ),
        );
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
