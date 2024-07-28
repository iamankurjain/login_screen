import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Gradient gradient;
  final double height;
  final double width;
  final Color textColor;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.gradient,
    this.height = 50.0,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0.0,
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              title,
              style: textStyle ??
                  TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
