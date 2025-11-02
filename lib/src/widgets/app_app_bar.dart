import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../foundation/ds_size.dart';
import '../foundation/ds_spacing.dart';
import '../foundation/ds_text_styles.dart';
import '../utils/ds_navigation_utils.dart';

/// AppAppBar with Design System Integration
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double appBarHeight;
  final VoidCallback? onBackPressed;
  final bool hideIcon;
  final Widget? endWidget;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;

  // NEW: Custom leading widget and border control
  final Widget? leadingWidget;
  final bool showLeadingBorder;
  final double? leadingBorderWidth;

  const AppAppBar({
    super.key,
    this.title,
    this.appBarHeight = kToolbarHeight,
    this.onBackPressed,
    this.hideIcon = false,
    this.endWidget,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.borderColor,
    this.titleFontWeight,
    this.titleFontSize,
    this.leadingWidget,
    this.showLeadingBorder = true,
    this.leadingBorderWidth,
  });

  /// copyWith method for easy customization
  AppAppBar copyWith({
    String? title,
    double? appBarHeight,
    VoidCallback? onBackPressed,
    bool? hideIcon,
    Widget? endWidget,
    Color? backgroundColor,
    Color? titleColor,
    Color? iconColor,
    Color? borderColor,
    FontWeight? titleFontWeight,
    double? titleFontSize,
    Widget? leadingWidget,
    bool? showLeadingBorder,
    double? leadingBorderWidth,
  }) {
    return AppAppBar(
      title: title ?? this.title,
      appBarHeight: appBarHeight ?? this.appBarHeight,
      onBackPressed: onBackPressed ?? this.onBackPressed,
      hideIcon: hideIcon ?? this.hideIcon,
      endWidget: endWidget ?? this.endWidget,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleColor: titleColor ?? this.titleColor,
      iconColor: iconColor ?? this.iconColor,
      borderColor: borderColor ?? this.borderColor,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      leadingWidget: leadingWidget ?? this.leadingWidget,
      showLeadingBorder: showLeadingBorder ?? this.showLeadingBorder,
      leadingBorderWidth: leadingBorderWidth ?? this.leadingBorderWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.lg.horizontal, // 16.w - Material & iOS standard
        vertical: DSSpacing.md.vertical, // 12.h
      ),
      child: AppBar(
        leading: GestureDetector(
          onTap:
              onBackPressed ?? () => NavigationUtils.defaultBackAction(context),
          child: hideIcon
              ? const SizedBox.shrink()
              : leadingWidget ?? _buildDefaultLeading(),
        ),
        title: title != null
            ? Text(
                title!,
                style: DSTextStyles.sectionHeader.copyWith(
                  color: titleColor ?? Colors.black,
                  fontWeight: titleFontWeight ?? FontWeight.w700,
                  fontSize: titleFontSize?.sp ?? 16.sp,
                ),
              )
            : null,
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor ?? Colors.transparent,
        leadingWidth: 52.w,
        actions: endWidget != null
            ? [
                Padding(
                  padding: EdgeInsets.only(
                    right: DSSpacing
                        .lg.horizontal, // 16.w - matches leading padding
                  ),
                  child: endWidget!,
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildDefaultLeading() {
    return Container(
      height: 44.h, // iOS: 44pt min, Material: 48dp min
      width: 44.w,
      decoration: BoxDecoration(
        borderRadius: DSRadius.sm, // 8.r
        border: showLeadingBorder
            ? Border.all(
                width: leadingBorderWidth ?? 1.w,
                color: borderColor ?? const Color(0xffDFE2E6),
              )
            : null,
      ),
      child: Center(
        child: Icon(
          Icons.arrow_back_ios_new,
          size: DSSize.iconSm, // 20.sp
          color: iconColor ?? const Color(0xff303136),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        appBarHeight + (DSSpacing.md.vertical * 2), // 12.h * 2 = 24.h
      );
}

/// Usage Examples:
/// 
/// // Basic usage (with default border)
/// AppAppBar(
///   title: 'Settings',
/// )
/// 
/// // Without border
/// AppAppBar(
///   title: 'Profile',
///   showLeadingBorder: false,
/// )
/// 
/// // Custom border color and width
/// AppAppBar(
///   title: 'Messages',
///   borderColor: Colors.blue,
///   leadingBorderWidth: 2,
/// )
/// 
/// // Custom leading widget
/// AppAppBar(
///   title: 'Custom',
///   leadingWidget: Container(
///     decoration: BoxDecoration(
///       color: Colors.blue,
///       shape: BoxShape.circle,
///     ),
///     child: Icon(Icons.close, color: Colors.white),
///   ),
/// )
/// 
/// // Hide back button
/// AppAppBar(
///   title: 'Home',
///   hideIcon: true,
/// )