import 'package:flutter/material.dart';
import '../../Configuration/AppColors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:bounce/bounce.dart';

class MyButton extends StatelessWidget {
  final String? btnLabel;
  final void Function() onPressed;
  final Color? color;
  final Widget? child;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? letterSpacing;
  final bool isLoading;
  final Border? border;
  final String? fontFamily;
  final BorderRadius? borderRadius;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const MyButton({
    super.key,
    this.btnLabel,
    required this.onPressed,
    this.color,
    this.textColor,
    this.child,
    this.height,
    this.width,
    this.border,
    this.letterSpacing,
    this.fontSize,
    this.fontFamily,
    this.borderRadius,
    this.fontWeight,
    this.isLoading = false,
    this.textStyle,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(duration: Duration(milliseconds: 1000)),
        MoveEffect(curve: Curves.fastLinearToSlowEaseIn),
      ],
      child: Bounce(
        duration: const Duration(milliseconds: 100),
        child: Container(
          margin: margin,
          padding: padding,
          height: height ?? 50,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            border: border,
            color: color ?? AppColors.backgroundColor,
          ),
          child: Center(
            child: child ?? Text(
                    btnLabel!,
                    style:
                        textStyle ??
                        TextStyle(
                          fontFamily: fontFamily ?? 'Poppins',
                          fontSize: fontSize ?? 16,
                          fontWeight: fontWeight ?? FontWeight.w600,
                          letterSpacing: letterSpacing ?? 0,
                          color: textColor ?? Colors.white,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
