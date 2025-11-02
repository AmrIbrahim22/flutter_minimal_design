import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../flutter_minimal_design.dart';
import '../foundation/ds_colors.dart';

/// Label position options
enum LabelPosition {
  /// Label appears above the form field (recommended)
  above,

  /// Label floats inside the form field (Material Design style)
  floating,
}

/// A highly customizable form field with design system integration
///
/// All styling parameters are OPTIONAL - sensible defaults are provided
/// from the design system or fallback values.
///
/// Features:
/// - Two label positioning modes (above or floating)
/// - Automatic password visibility toggle with dual icons
/// - Full design system integration
/// - SVG icon support
///
/// Basic Usage:
/// ```dart
/// CustomFormField(
///   labelText: 'Email',
///   hintText: 'Enter your email',
/// )
/// ```
///
/// Password with auto-toggle:
/// ```dart
/// CustomFormField(
///   labelText: 'Password',
///   obscureText: true,
///   suffixIconPath: 'assets/icons/eye_closed.svg',
///   suffixIconPathAlt: 'assets/icons/eye_open.svg', // Enables auto-toggle
/// )
/// ```
class CustomFormField extends StatefulWidget {
  final String? labelText;
  final LabelPosition labelPosition;
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

  /// Alternate suffix icon (for password toggle)
  /// When provided with suffixIconPath, enables automatic visibility toggle
  final String? suffixIconPathAlt;
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
    this.labelPosition = LabelPosition.above,
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
    this.suffixIconPathAlt,
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
    LabelPosition? labelPosition,
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
    String? suffixIconPathAlt,
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
      labelPosition: labelPosition ?? this.labelPosition,
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
      suffixIconPathAlt: suffixIconPathAlt ?? this.suffixIconPathAlt,
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
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  // Internal state for password visibility toggle
  late bool _obscureText;

  // Check if auto-toggle is enabled (both icon paths provided)
  bool get _hasAutoToggle =>
      widget.obscureText &&
      widget.suffixIconPath != null &&
      widget.suffixIconPathAlt != null;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(CustomFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  /// Toggle password visibility
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
    // Call user callback if provided
    widget.onSuffixIconTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    // Default values from design system
    final defaultContentPadding =
        widget.contentPadding ?? DSEdgeInsets.formField;
    final defaultBorderRadius = widget.borderRadius ?? DSSize.radiusMd;
    final defaultBorderColor = widget.borderColor ?? DSColors.border;
    final defaultFocusedBorderColor =
        widget.focusedBorderColor ?? DSColors.border;
    final defaultErrorBorderColor =
        widget.errorBorderColor ?? const Color(0xFFDC3545);
    final defaultFillColor = widget.fillColor ?? Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label above field (if position is above)
        if (widget.labelPosition == LabelPosition.above &&
            widget.labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              widget.labelText!,
              style:
                  widget.labelStyle ??
                  DSTextStyles.label.copyWith(
                    color: const Color(0xFF292D32),
                    fontSize: 14.sp,
                  ),
            ),
          ),

        // Main text form field
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: _obscureText ? 1 : widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          textCapitalization: widget.textCapitalization,
          autofocus: widget.autofocus,
          style: widget.textStyle ?? DSTextStyles.formField,
          decoration: InputDecoration(
            // Label for floating position only
            labelText: widget.labelPosition == LabelPosition.floating
                ? widget.labelText
                : null,
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText,
            labelStyle:
                widget.labelStyle ??
                DSTextStyles.label.copyWith(color: const Color(0xff6B7280)),
            hintStyle:
                widget.hintStyle ??
                DSTextStyles.hint.copyWith(color: const Color(0xff9CA3AF)),
            errorStyle:
                widget.errorStyle ??
                DSTextStyles.error.copyWith(color: defaultErrorBorderColor),
            filled: true,
            fillColor: defaultFillColor,
            contentPadding: defaultContentPadding,

            // Prefix icon
            prefixIcon: _buildIcon(
              widget: widget.prefixIcon,
              iconPath: widget.prefixIconPath,
              iconColor: widget.prefixIconColor,
              onTap: widget.onPrefixIconTap,
            ),

            // Suffix icon (with auto-toggle support)
            suffixIcon: _buildSuffixIcon(),

            // Borders
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              borderSide: BorderSide(color: defaultBorderColor, width: 1.w),
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
        ),
      ],
    );
  }

  /// Build suffix icon with auto-toggle support
  Widget? _buildSuffixIcon() {
    // Custom widget takes priority
    if (widget.suffixIcon != null) {
      return widget.onSuffixIconTap != null
          ? GestureDetector(
              onTap: widget.onSuffixIconTap,
              child: widget.suffixIcon,
            )
          : widget.suffixIcon;
    }

    // Auto-toggle password visibility (when both icons provided)
    if (_hasAutoToggle) {
      final iconPath = _obscureText
          ? widget.suffixIconPath!
          : widget.suffixIconPathAlt!;
      return _buildIcon(
        iconPath: iconPath,
        iconColor: widget.suffixIconColor,
        onTap: _toggleObscureText,
      );
    }

    // Single suffix icon (manual control)
    if (widget.suffixIconPath != null) {
      return _buildIcon(
        iconPath: widget.suffixIconPath!,
        iconColor: widget.suffixIconColor,
        onTap: widget.onSuffixIconTap,
      );
    }

    return null;
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
          width: DSSize.formFieldIconSize, // 20.w
          height: DSSize.formFieldIconSize, // 20.h
          colorFilter: iconColor != null
              ? ColorFilter.mode(iconColor, BlendMode.srcIn)
              : null,
        ),
      );

      return onTap != null ? GestureDetector(onTap: onTap, child: icon) : icon;
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
    LabelPosition labelPosition = LabelPosition.above,
  }) {
    return CustomFormField(
      labelText: labelText ?? 'Email',
      hintText: hintText ?? 'Enter your email',
      labelPosition: labelPosition,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      prefixIconPath: 'assets/icons/email.svg',
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
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

  /// Password field with automatic visibility toggle
  static CustomFormField password({
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    bool showVisibilityToggle = true,
    LabelPosition labelPosition = LabelPosition.above,
  }) {
    return CustomFormField(
      labelText: labelText ?? 'Password',
      hintText: hintText ?? 'Enter your password',
      labelPosition: labelPosition,
      controller: controller,
      obscureText: true,
      prefixIconPath: 'assets/icons/lock.svg',
      // Dual icons for auto-toggle
      suffixIconPath: showVisibilityToggle
          ? 'assets/icons/eye_closed.svg'
          : null,
      suffixIconPathAlt: showVisibilityToggle
          ? 'assets/icons/eye_open.svg'
          : null,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
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
    LabelPosition labelPosition = LabelPosition.above,
  }) {
    return CustomFormField(
      labelText: labelText ?? 'Phone',
      hintText: hintText ?? 'Enter your phone number',
      labelPosition: labelPosition,
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
      labelPosition: LabelPosition.floating,
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
    LabelPosition labelPosition = LabelPosition.above,
  }) {
    return CustomFormField(
      labelText: labelText,
      hintText: hintText,
      labelPosition: labelPosition,
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
    LabelPosition labelPosition = LabelPosition.above,
  }) {
    return CustomFormField(
      labelText: labelText,
      hintText: hintText,
      labelPosition: labelPosition,
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
/// // Basic text field with label above
/// CustomFormField(
///   labelText: 'Name',
///   hintText: 'Enter your name',
/// )
/// 
/// // Floating label (Material Design style)
/// CustomFormField(
///   labelText: 'Email',
///   labelPosition: LabelPosition.floating,
///   hintText: 'Enter your email',
/// )
/// 
/// // Password with automatic visibility toggle
/// CustomFormField(
///   labelText: 'Password',
///   obscureText: true,
///   suffixIconPath: 'assets/icons/eye_closed.svg',
///   suffixIconPathAlt: 'assets/icons/eye_open.svg', // Enables auto-toggle
/// )
/// 
/// // Password with manual control (no auto-toggle)
/// CustomFormField(
///   labelText: 'Password',
///   obscureText: _obscure,
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