import 'package:flutter/material.dart';
import 'CustomImageView.dart';

/// ✅ Universal Container Widget
class MyContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
  final BoxConstraints? constraints;
  final GestureTapCallback? onTap;

  // Optional padding values
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;

  const MyContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
    this.width,
    this.height,
    this.decoration,
    this.color,
    this.borderRadius,
    this.border,
    this.gradient,
    this.boxShadow,
    this.constraints,
    this.onTap,
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = decoration ??
        BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          border: border,
          gradient: gradient,
          boxShadow: boxShadow,
        );

    Widget container = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ??
          EdgeInsets.only(
            left: paddingLeft ?? 0,
            right: paddingRight ?? 0,
            top: paddingTop ?? 0,
            bottom: paddingBottom ?? 0,
          ),
      alignment: alignment,
      constraints: constraints,
      decoration: effectiveDecoration,
      child: child,
    );

    // Wrap with GestureDetector only if onTap is provided
    if (onTap != null) {
      container = GestureDetector(onTap: onTap, child: container);
    }

    return container;
  }
}

/// ✅ Icon Container Widget
/// Supports both [IconData] and [ImagePath]
class MyIconContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;
  final double? iconHeight;
  final BoxDecoration? decoration;
  final Color? color;
  final Color? iconColor;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final GestureTapCallback? onTap;

  // 🔹 Either of these can be used
  final String? iconAsset; // For image assets
  final IconData? iconData; // For material icons

  const MyIconContainer({
    super.key,
    this.width,
    this.height,
    this.decoration,
    this.color,
    this.padding,
    this.margin,
    this.alignment,
    this.borderRadius,
    this.border,
    this.onTap,
    this.iconHeight,
    this.iconAsset,
    this.iconData,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: onTap,
      height: height ?? 48,
      width: width ?? 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        color: color ?? Colors.transparent,
      ),
      child: _buildIcon(),
    );
  }

  /// 🔹 Build either an Icon or Image based on what is provided
  Widget _buildIcon() {
    if (iconData != null) {
      return Icon(
        iconData,
        size: iconHeight ?? 24,
        color: iconColor ?? Colors.black,
      );
    } else if (iconAsset != null) {
      return CommonImageView(
        imagePath: iconAsset!,
        height: iconHeight ?? 24,
        svgColor: iconColor,
        fit: BoxFit.contain,
      );
    } else {
      return const SizedBox.shrink(); // Nothing if both are null
    }
  }
}
