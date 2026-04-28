import 'package:flutter/material.dart';

// ─── Enums ───────────────────────────────────────────────────────────────────

enum NeumorphismType {
  flat,    // raised / embossed look (default)
  pressed, // inset / debossed look
}

// ─── Style ───────────────────────────────────────────────────────────────────

class NeumorphismStyle {
  const NeumorphismStyle({
    this.color = const Color(0xFFE8EDF2),
    this.borderRadius = 16.0,
    this.depth = 8.0,
    this.type = NeumorphismType.flat,
    this.shape = BoxShape.rectangle,
    this.lightShadow,
    this.darkShadow,
  });

  final Color color;
  final double borderRadius;

  /// Shadow depth — controls offset & blur. Range: 0–20. Default: 8.
  final double depth;
  final NeumorphismType type;
  final BoxShape shape;

  /// Overrides the auto-computed highlight shadow color.
  final Color? lightShadow;

  /// Overrides the auto-computed dark shadow color.
  final Color? darkShadow;

  Color get resolvedLight => lightShadow ?? _lighten(color, 0.10);
  Color get resolvedDark => darkShadow ?? _darken(color, 0.12);

  static Color _lighten(Color c, double amount) {
    final h = HSLColor.fromColor(c);
    return h.withLightness((h.lightness + amount).clamp(0.0, 1.0)).toColor();
  }

  static Color _darken(Color c, double amount) {
    final h = HSLColor.fromColor(c);
    return h
        .withLightness((h.lightness - amount).clamp(0.0, 1.0))
        .withSaturation((h.saturation + 0.05).clamp(0.0, 1.0))
        .toColor();
  }

  NeumorphismStyle copyWith({
    Color? color,
    double? borderRadius,
    double? depth,
    NeumorphismType? type,
    BoxShape? shape,
    Color? lightShadow,
    Color? darkShadow,
  }) =>
      NeumorphismStyle(
        color: color ?? this.color,
        borderRadius: borderRadius ?? this.borderRadius,
        depth: depth ?? this.depth,
        type: type ?? this.type,
        shape: shape ?? this.shape,
        lightShadow: lightShadow ?? this.lightShadow,
        darkShadow: darkShadow ?? this.darkShadow,
      );
}

// ─── FlutterNeumorphism (new simple API) ─────────────────────────────────────

class FlutterNeumorphism extends StatelessWidget {
  const FlutterNeumorphism({
    super.key,
    required this.child,
    this.style = const NeumorphismStyle(),
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  final Widget child;
  final NeumorphismStyle style;
  final VoidCallback? onTap;

  /// If omitted the container sizes itself to its child.
  final double? width;

  /// If omitted the container sizes itself to its child.
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final isCircle = style.shape == BoxShape.circle;
    final isPressed = style.type == NeumorphismType.pressed;
    final d = style.depth;

    final shadows = isPressed
        ? [
            BoxShadow(
              color: style.resolvedDark,
              offset: Offset(d * 0.5, d * 0.5),
              blurRadius: d,
              spreadRadius: -(d * 0.25),
            ),
            BoxShadow(
              color: style.resolvedLight,
              offset: Offset(-(d * 0.5), -(d * 0.5)),
              blurRadius: d,
              spreadRadius: -(d * 0.25),
            ),
          ]
        : [
            BoxShadow(
              color: style.resolvedDark,
              offset: Offset(d * 0.6, d * 0.6),
              blurRadius: d * 1.5,
            ),
            BoxShadow(
              color: style.resolvedLight,
              offset: Offset(-(d * 0.6), -(d * 0.6)),
              blurRadius: d * 1.5,
            ),
          ];

    Widget w = Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin,
      alignment: isCircle ? Alignment.center : null,
      decoration: BoxDecoration(
        color: style.color,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircle ? null : BorderRadius.circular(style.borderRadius),
        boxShadow: shadows,
      ),
      child: child,
    );

    return onTap != null ? GestureDetector(onTap: onTap, child: w) : w;
  }
}

// ─── FlutterNeumorphisms (legacy API — kept for backward compatibility) ───────

class FlutterNeumorphisms extends StatefulWidget {
  const FlutterNeumorphisms({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    this.padding,
    this.margin,
    required this.backgroundColor,
    this.borderRadius,
    this.boxShape,
    required this.bottomRightShadowColor,
    required this.topLeftShadowColor,
    this.bottomRightShadowBlurRadius,
    this.bottomRightShadowSpreadRadius,
    this.topLeftShadowBlurRadius,
    this.topLeftShadowSpreadRadius,
    required this.onTap,
    this.borderWidth,
    this.borderColor,
    this.topLeftOffset,
    this.bottomRightOffset,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final double? borderRadius;
  final BoxShape? boxShape;
  final Color bottomRightShadowColor;
  final Color topLeftShadowColor;
  final double? bottomRightShadowBlurRadius;
  final double? bottomRightShadowSpreadRadius;
  final double? topLeftShadowBlurRadius;
  final double? topLeftShadowSpreadRadius;
  final VoidCallback onTap;
  final Offset? topLeftOffset;
  final Offset? bottomRightOffset;
  final double? borderWidth;
  final Color? borderColor;

  @override
  State<FlutterNeumorphisms> createState() => _FlutterNeumorphismsState();
}

class _FlutterNeumorphismsState extends State<FlutterNeumorphisms> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: widget.padding ?? const EdgeInsets.all(15),
        margin: widget.margin ?? const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          shape: widget.boxShape ?? BoxShape.rectangle,
          border: Border.all(
            width: widget.borderWidth ?? 0,
            color: widget.borderColor ?? widget.backgroundColor,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.bottomRightShadowColor,
              offset: widget.bottomRightOffset ?? const Offset(2, 2),
              blurRadius: widget.bottomRightShadowBlurRadius ?? 15,
              spreadRadius: widget.bottomRightShadowSpreadRadius ?? 1,
            ),
            BoxShadow(
              color: widget.topLeftShadowColor,
              offset: widget.topLeftOffset ?? const Offset(-2, -2),
              blurRadius: widget.topLeftShadowBlurRadius ?? 15,
              spreadRadius: widget.topLeftShadowSpreadRadius ?? 1,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
