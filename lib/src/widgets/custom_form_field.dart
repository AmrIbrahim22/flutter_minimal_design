import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../flutter_minimal_design.dart';
import '../foundation/ds_colors.dart';

/// CustomFormField with Design System Integration
class CustomFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final VoidCallback? onSuffixIconTap;
  final VoidCallback? onPrefixIconTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final bool autofocus;

  const CustomFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconPath,
    this.suffixIconPath,
    this.prefixIconColor,
    this.suffixIconColor,
    this.onSuffixIconTap,
    this.onPrefixIconTap,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
  });

  /// Complete copyWith method
  CustomFormField copyWith({
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool? obscureText,
    bool? enabled,
    bool? readOnly,
    int? maxLines,
    int? minLines,
    int? maxLength,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? prefixIconPath,
    String? suffixIconPath,
    Color? prefixIconColor,
    Color? suffixIconColor,
    VoidCallback? onSuffixIconTap,
    VoidCallback? onPrefixIconTap,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onTap,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    EdgeInsetsGeometry? contentPadding,
    Color? fillColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderRadius,
    TextStyle? textStyle,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    FocusNode? focusNode,
    TextCapitalization? textCapitalization,
    bool? autofocus,
  }) {
    return CustomFormField(
      labelText: labelText ?? this.labelText,
      hintText: hintText ?? this.hintText,
      helperText: helperText ?? this.helperText,
      errorText: errorText ?? this.errorText,
      controller: controller ?? this.controller,
      keyboardType: keyboardType ?? this.keyboardType,
      obscureText: obscureText ?? this.obscureText,
      enabled: enabled ?? this.enabled,
      readOnly: readOnly ?? this.readOnly,
      maxLines: maxLines ?? this.maxLines,
      minLines: minLines ?? this.minLines,
      maxLength: maxLength ?? this.maxLength,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      prefixIconPath: prefixIconPath ?? this.prefixIconPath,
      suffixIconPath: suffixIconPath ?? this.suffixIconPath,
      prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
      onSuffixIconTap: onSuffixIconTap ?? this.onSuffixIconTap,
      onPrefixIconTap: onPrefixIconTap ?? this.onPrefixIconTap,
      onChanged: onChanged ?? this.onChanged,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onTap: onTap ?? this.onTap,
      validator: validator ?? this.validator,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      contentPadding: contentPadding ?? this.contentPadding,
      fillColor: fillColor ?? this.fillColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      focusNode: focusNode ?? this.focusNode,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      autofocus: autofocus ?? this.autofocus,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Default values from design system
    final defaultContentPadding = contentPadding ?? DSEdgeInsets.formField;
    final defaultBorderRadius = borderRadius ?? DSSize.radiusMd;
    final defaultBorderColor = borderColor ??  DSColors.border;
    final defaultFocusedBorderColor = focusedBorderColor ?? const Color(0xFF1A4220);
    final defaultErrorBorderColor = errorBorderColor ?? const Color(0xFFDC3545);
    final defaultFillColor = fillColor ?? Colors.white;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      validator: validator,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      autofocus: autofocus,
      style: textStyle ?? DSTextStyles.formField,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        labelStyle: labelStyle ?? DSTextStyles.label.copyWith(
          color: const Color(0xff6B7280),
        ),
        hintStyle: hintStyle ?? DSTextStyles.hint.copyWith(
          color: const Color(0xff9CA3AF),
        ),
        errorStyle: errorStyle ?? DSTextStyles.error.copyWith(
          color: defaultErrorBorderColor,
        ),
        filled: true,
        fillColor: defaultFillColor,
        contentPadding: defaultContentPadding,
        
        // Prefix icon
        prefixIcon: _buildIcon(
          widget: prefixIcon,
          iconPath: prefixIconPath,
          iconColor: prefixIconColor,
          onTap: onPrefixIconTap,
        ),
        
        // Suffix icon
        suffixIcon: _buildIcon(
          widget: suffixIcon,
          iconPath: suffixIconPath,
          iconColor: suffixIconColor,
          onTap: onSuffixIconTap,
        ),
        
        // Borders
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          borderSide: BorderSide(
            color: defaultBorderColor,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          borderSide: BorderSide(
            color: defaultFocusedBorderColor,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          borderSide: BorderSide(
            color: defaultErrorBorderColor,
            width: 1.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          borderSide: BorderSide(
            color: defaultErrorBorderColor,
            width: 2.w,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          borderSide: BorderSide(
            color: defaultBorderColor.withOpacity(0.5),
            width: 1.w,
          ),
        ),
      ),
    );
  }

  Widget? _buildIcon({
    Widget? widget,
    String? iconPath,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    if (widget != null) {
      return onTap != null
          ? GestureDetector(onTap: onTap, child: widget)
          : widget;
    }

    if (iconPath != null) {
      final icon = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DSSpacing.md.horizontal, // 12.w
        ),
        child: SvgPicture.asset(
          iconPath,
          width: DSSize.formFieldIconSize,  // 20.w
          height: DSSize.formFieldIconSize, // 20.h
          colorFilter: iconColor != null
              ? ColorFilter.mode(iconColor, BlendMode.srcIn)
              : null,
        ),
      );

      return onTap != null
          ? GestureDetector(onTap: onTap, child: icon)
          : icon;
    }

    return null;
  }
}

/// Pre-configured form field variants
class DSFormField {
  /// Email field
  static CustomFormField email({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return CustomFormField(
      labelText: labelText ?? 'Email',
      hintText: hintText ?? 'Enter your email',
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      prefixIconPath: 'assets/icons/email.svg',
      onChanged: onChanged,
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        if (!value.contains('@')) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }

  /// Password field
  static CustomFormField password({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool showVisibilityToggle = true,
  }) {
    return CustomFormField(
      labelText: labelText ?? 'Password',
      hintText: hintText ?? 'Enter your password',
      controller: controller,
      obscureText: true,
      prefixIconPath: 'assets/icons/lock.svg',
      suffixIconPath: showVisibilityToggle ? 'assets/icons/eye.svg' : null,
      onChanged: onChanged,
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  /// Phone field
  static CustomFormField phone({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return CustomFormField(
      labelText: labelText ?? 'Phone',
      hintText: hintText ?? 'Enter your phone number',
      controller: controller,
      keyboardType: TextInputType.phone,
      prefixIconPath: 'assets/icons/phone.svg',
      onChanged: onChanged,
      validator: validator,
    );
  }

  /// Search field
  static CustomFormField search({
    String? hintText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    VoidCallback? onClear,
  }) {
    return CustomFormField(
      hintText: hintText ?? 'Search...',
      controller: controller,
      prefixIconPath: 'assets/icons/search.svg',
      suffixIconPath: 'assets/icons/close.svg',
      onSuffixIconTap: onClear,
      onChanged: onChanged,
    );
  }

  /// Multiline text area
  static CustomFormField textArea({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    int maxLines = 5,
    int? maxLength,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return CustomFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      maxLines: maxLines,
      minLines: 3,
      maxLength: maxLength,
      onChanged: onChanged,
      validator: validator,
    );
  }

  /// Number field
  static CustomFormField number({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
  }) {
    return CustomFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      validator: validator,
    );
  }
}

/// Usage Examples:
/// 
/// // Basic text field
/// CustomFormField(
///   labelText: 'Name',
///   hintText: 'Enter your name',
/// )
/// 
/// // With controller and validation
/// CustomFormField(
///   labelText: 'Email',
///   controller: emailController,
///   validator: (value) => value!.isEmpty ? 'Required' : null,
/// )
/// 
/// // With icons
/// CustomFormField(
///   hintText: 'Search',
///   prefixIconPath: 'assets/icons/search.svg',
///   suffixIconPath: 'assets/icons/close.svg',
///   onSuffixIconTap: () => controller.clear(),
/// )
/// 
/// // Password field
/// CustomFormField(
///   labelText: 'Password',
///   obscureText: true,
///   prefixIconPath: 'assets/icons/lock.svg',
///   suffixIconPath: 'assets/icons/eye.svg',
///   onSuffixIconTap: () => setState(() => _obscure = !_obscure),
/// )
/// 
/// // Using pre-configured variants
/// DSFormField.email(
///   controller: emailController,
/// )
/// 
/// DSFormField.password(
///   controller: passwordController,
/// )
/// 
/// DSFormField.phone(
///   controller: phoneController,
/// )
/// 
/// DSFormField.search(
///   onChanged: (value) => _performSearch(value),
///   onClear: () => _clearSearch(),
/// )
/// 
/// DSFormField.textArea(
///   labelText: 'Description',
///   maxLength: 500,
/// )
/// 
/// // Using copyWith
/// final baseField = CustomFormField(
///   hintText: 'Base field',
/// );
/// 
/// final emailField = baseField.copyWith(
///   labelText: 'Email',
///   keyboardType: TextInputType.emailAddress,
///   prefixIconPath: 'assets/icons/email.svg',
/// );