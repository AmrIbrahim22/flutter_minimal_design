import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../flutter_minimal_design.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../flutter_minimal_design.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? borderColor;
  final bool? isIconButton;
  final String? iconPath;
  final double? iconSpacer;
  final Color? iconColor;
  final bool? enabled;
  final double? labelSize;
  final FontWeight? labelFontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  
  // Gradient properties
  final bool useGradient;
  final Gradient? gradient;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.padding,
    this.width,
    this.height,
    this.borderColor,
    this.isIconButton,
    this.iconPath,
    this.iconSpacer,
    this.iconColor,
    this.enabled = true,
    this.labelSize,
    this.labelFontWeight,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.useGradient = false,
    this.gradient,
  });

  /// Complete copyWith method with all parameters
  CustomButton copyWith({
    String? label,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Color? borderColor,
    bool? isIconButton,
    String? iconPath,
    double? iconSpacer,
    Color? iconColor,
    bool? enabled,
    double? labelSize,
    FontWeight? labelFontWeight,
    int? maxLines,
    TextOverflow? overflow,
    bool? useGradient,
    Gradient? gradient,
  }) {
    return CustomButton(
      label: label ?? this.label,
      onPressed: onPressed ?? this.onPressed,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      width: width ?? this.width,
      height: height ?? this.height,
      borderColor: borderColor ?? this.borderColor,
      isIconButton: isIconButton ?? this.isIconButton,
      iconPath: iconPath ?? this.iconPath,
      iconSpacer: iconSpacer ?? this.iconSpacer,
      iconColor: iconColor ?? this.iconColor,
      enabled: enabled ?? this.enabled,
      labelSize: labelSize ?? this.labelSize,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      useGradient: useGradient ?? this.useGradient,
      gradient: gradient ?? this.gradient,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonChild = (isIconButton ?? false) && iconPath != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath!,
                width: DSSize.iconMd,
                height: DSSize.iconMd,
                fit: BoxFit.contain,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              ),
              SizedBox(
                width: iconSpacer ?? DSSpacing.xsm.horizontal,
              ),
              Flexible(
                child: Text(
                  label,
                  style: DSTextStyles.button.copyWith(
                    color: textColor,
                    fontSize: labelSize?.sp ?? 16.sp,
                    fontWeight: labelFontWeight ?? FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  overflow: overflow,
                  softWrap: true,
                  maxLines: maxLines,
                ),
              ),
            ],
          )
        : Text(
            label,
            style: DSTextStyles.button.copyWith(
              color: textColor,
              fontSize: labelSize?.sp ?? 16.sp,
              fontWeight: labelFontWeight ?? FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            overflow: overflow,
            softWrap: true,
            maxLines: maxLines,
          );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? DSSize.buttonHeight,
      child: useGradient && gradient != null
          ? _buildGradientButton(buttonChild)
          : _buildSolidButton(buttonChild),
    );
  }

  Widget _buildSolidButton(Widget child) {
    return ElevatedButton(
      onPressed: (enabled ?? true) ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor?.withOpacity(0.5),
        foregroundColor: textColor,
        overlayColor: (enabled ?? true) ? null : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          side: borderColor != null
              ? BorderSide(
                  width: 1.w,
                  color: borderColor!,
                )
              : BorderSide.none,
        ),
        padding: padding ?? DSEdgeInsets.button,
        elevation: 0,
      ),
      child: child,
    );
  }

  Widget _buildGradientButton(Widget child) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: (enabled ?? true) 
            ? gradient 
            : _createDisabledGradient(),
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: borderColor != null
            ? Border.all(
                width: 1.w,
                color: borderColor!,
              )
            : null,
      ),
      child: ElevatedButton(
        onPressed: (enabled ?? true) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: textColor,
          disabledBackgroundColor: Colors.transparent,
          overlayColor: (enabled ?? true) ? null : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: BorderSide.none,
          ),
          padding: padding ?? DSEdgeInsets.button,
          elevation: 0,
        ),
        child: child,
      ),
    );
  }

  Gradient _createDisabledGradient() {
    if (gradient is LinearGradient) {
      final linear = gradient as LinearGradient;
      return LinearGradient(
        colors: linear.colors.map((c) => c.withOpacity(0.5)).toList(),
        begin: linear.begin,
        end: linear.end,
        stops: linear.stops,
      );
    } else if (gradient is RadialGradient) {
      final radial = gradient as RadialGradient;
      return RadialGradient(
        colors: radial.colors.map((c) => c.withOpacity(0.5)).toList(),
        center: radial.center,
        radius: radial.radius,
        stops: radial.stops,
      );
    } else if (gradient is SweepGradient) {
      final sweep = gradient as SweepGradient;
      return SweepGradient(
        colors: sweep.colors.map((c) => c.withOpacity(0.5)).toList(),
        center: sweep.center,
        startAngle: sweep.startAngle,
        endAngle: sweep.endAngle,
        stops: sweep.stops,
      );
    }
    return LinearGradient(
      colors: [Colors.grey.withOpacity(0.5), Colors.grey.withOpacity(0.5)],
    );
  }
}

/// Pre-configured button variants following design system
class DSButton {
  /// Primary button (filled, main action)
  static CustomButton primary({
    required String label,
    required VoidCallback onPressed,
    bool enabled = true,
    bool isIconButton = false,
    String? iconPath,
    Color? iconColor,
    double? width,
    double? height,
    bool useGradient = false,
    Gradient? gradient,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF1A4220),
      textColor: Colors.white,
      enabled: enabled,
      isIconButton: isIconButton,
      iconPath: iconPath,
      iconColor: iconColor,
      width: width,
      height: height,
      useGradient: useGradient,
      gradient: gradient,
    );
  }

  /// Secondary button (outlined, less emphasis)
  static CustomButton secondary({
    required String label,
    required VoidCallback onPressed,
    bool enabled = true,
    bool isIconButton = false,
    String? iconPath,
    double? width,
    double? height,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      textColor: const Color(0xFF1A4220),
      borderColor: const Color(0xFF1A4220),
      enabled: enabled,
      isIconButton: isIconButton,
      iconPath: iconPath,
      iconColor: const Color(0xFF1A4220),
      width: width,
      height: height,
    );
  }

  /// Danger button (destructive action)
  static CustomButton danger({
    required String label,
    required VoidCallback onPressed,
    bool enabled = true,
    double? width,
    double? height,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color(0xFFDC3545),
      textColor: Colors.white,
      enabled: enabled,
      width: width,
      height: height,
    );
  }

  /// Text button (minimal, tertiary action)
  static CustomButton text({
    required String label,
    required VoidCallback onPressed,
    bool enabled = true,
    Color? textColor,
    double? width,
    double? height,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      textColor: textColor ?? const Color(0xFF1A4220),
      borderColor: Colors.transparent,
      enabled: enabled,
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.md.horizontal,
        vertical: DSSpacing.sm.vertical,
      ),
      width: width,
      height: height,
    );
  }

  /// Success button (confirmation action)
  static CustomButton success({
    required String label,
    required VoidCallback onPressed,
    bool enabled = true,
    double? width,
    double? height,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF28A745),
      textColor: Colors.white,
      enabled: enabled,
      width: width,
      height: height,
    );
  }

  /// Warning button (caution action)
  static CustomButton warning({
    required String label,
    required VoidCallback onPressed,
    bool enabled = true,
    double? width,
    double? height,
  }) {
    return CustomButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color(0xFFFFC107),
      textColor: Colors.black87,
      enabled: enabled,
      width: width,
      height: height,
    );
  }
}

/// Usage Examples:
/// 
/// // Basic gradient button
/// CustomButton(
///   label: 'Gradient Button',
///   onPressed: () {},
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Colors.blue, Colors.purple],
///   ),
///   textColor: Colors.white,
/// )
/// 
/// // Gradient with custom stops and angles
/// CustomButton(
///   label: 'Custom Gradient',
///   onPressed: () {},
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Color(0xFF1A4220), Color(0xFF2E7D32), Color(0xFF66BB6A)],
///     stops: [0.0, 0.5, 1.0],
///     begin: Alignment.topLeft,
///     end: Alignment.bottomRight,
///   ),
///   textColor: Colors.white,
/// )
/// 
/// // Radial gradient
/// CustomButton(
///   label: 'Radial Gradient',
///   onPressed: () {},
///   useGradient: true,
///   gradient: RadialGradient(
///     colors: [Colors.orange, Colors.red],
///     center: Alignment.center,
///     radius: 0.8,
///   ),
///   textColor: Colors.white,
/// )
/// 
/// // Using copyWith to add gradient
/// final baseButton = CustomButton(
///   label: 'Base',
///   onPressed: () {},
///   backgroundColor: Colors.blue,
/// );
/// 
/// final gradientButton = baseButton.copyWith(
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Colors.blue, Colors.purple],
///   ),
/// );
/// 
/// // Gradient with icon
/// CustomButton(
///   label: 'Add to Cart',
///   onPressed: () {},
///   isIconButton: true,
///   iconPath: 'assets/icons/cart.svg',
///   iconColor: Colors.white,
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Color(0xFF1A4220), Color(0xFF2E7D32)],
///   ),
///   textColor: Colors.white,
/// )
/// 
/// // Disabled gradient button (automatically faded)
/// CustomButton(
///   label: 'Disabled Gradient',
///   onPressed: () {},
///   enabled: false,
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Colors.blue, Colors.purple],
///   ),
///   textColor: Colors.white,
/// )
/// 
/// // Primary button with gradient
/// DSButton.primary(
///   label: 'Continue',
///   onPressed: () {},
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Color(0xFF1A4220), Color(0xFF2E7D32)],
///   ),
/// )
/// 
/// // Gradient with border
/// CustomButton(
///   label: 'Bordered Gradient',
///   onPressed: () {},
///   useGradient: true,
///   gradient: LinearGradient(
///     colors: [Colors.transparent, Colors.transparent],
///   ),
///   borderColor: Colors.blue,
///   textColor: Colors.blue,
/// )