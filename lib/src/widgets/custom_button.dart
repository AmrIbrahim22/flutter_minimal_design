import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../flutter_minimal_design.dart';
import '../foundation/ds_colors.dart';

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

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor ,
    this.textColor ,
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
  }) {
    return CustomButton(
      label: label ?? this.label,
      onPressed: onPressed ?? this.onPressed,
      backgroundColor: backgroundColor ?? DSColors.primary,
      textColor: textColor ?? Colors.white,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? DSSize.buttonHeight, // Default: 48.h
      child: ElevatedButton(
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
          padding: padding ?? DSEdgeInsets.button, // Default: 16.w × 12.h
          elevation: 0,
        ),
        child: (isIconButton ?? false) && iconPath != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    iconPath!,
                    width: DSSize.iconMd,   // 24.w (design system standard)
                    height: DSSize.iconMd,  // 24.h
                    fit: BoxFit.contain,
                    colorFilter: iconColor != null
                        ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                        : null,
                  ),
                  SizedBox(
                    width: iconSpacer ?? DSSpacing.xsm.horizontal, // Default: 4.w
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
              ),
      ),
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
        horizontal: DSSpacing.md.horizontal,  // 12.w
        vertical: DSSpacing.sm.vertical,       // 8.h
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
/// // Basic usage with design system defaults
/// CustomButton(
///   label: 'Submit',
///   onPressed: () => print('Pressed'),
/// )
/// 
/// // Button with icon
/// CustomButton(
///   label: 'Add to Cart',
///   onPressed: () {},
///   isIconButton: true,
///   iconPath: 'assets/icons/cart.svg',
///   iconColor: Colors.white,
/// )
/// 
/// // Disabled button
/// CustomButton(
///   label: 'Submit',
///   onPressed: () {},
///   enabled: false,
/// )
/// 
/// // Custom styling
/// CustomButton(
///   label: 'Custom',
///   onPressed: () {},
///   backgroundColor: Colors.purple,
///   textColor: Colors.white,
///   borderRadius: 20,
///   height: 56.h,
/// )
/// 
/// // Using pre-configured variants
/// DSButton.primary(
///   label: 'Continue',
///   onPressed: () {},
/// )
/// 
/// DSButton.secondary(
///   label: 'Cancel',
///   onPressed: () {},
/// )
/// 
/// DSButton.danger(
///   label: 'Delete',
///   onPressed: () {},
/// )
/// 
/// DSButton.success(
///   label: 'Confirm',
///   onPressed: () {},
/// )
/// 
/// DSButton.warning(
///   label: 'Proceed with Caution',
///   onPressed: () {},
/// )
/// 
/// DSButton.text(
///   label: 'Skip',
///   onPressed: () {},
/// )
/// 
/// // Using copyWith for variants
/// final baseButton = CustomButton(
///   label: 'Base',
///   onPressed: () {},
/// );
/// 
/// final largeButton = baseButton.copyWith(
///   height: 56.h,
///   labelSize: 18,
/// );
/// 
/// final outlinedButton = baseButton.copyWith(
///   backgroundColor: Colors.transparent,
///   borderColor: const Color(0xFF1A4220),
///   textColor: const Color(0xFF1A4220),
/// );
/// 
/// final disabledButton = baseButton.copyWith(
///   enabled: false,
/// );
/// 
/// // Responsive button grid
/// Row(
///   children: [
///     Expanded(
///       child: DSButton.secondary(
///         label: 'Cancel',
///         onPressed: () {},
///       ),
///     ),
///     SizedBox(width: DSSpacing.md.horizontal), // 12.w gap
///     Expanded(
///       child: DSButton.primary(
///         label: 'Confirm',
///         onPressed: () {},
///       ),
///     ),
///   ],
/// )