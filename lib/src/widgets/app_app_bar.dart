import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../foundation/ds_size.dart';
import '../foundation/ds_spacing.dart';
import '../foundation/ds_text_styles.dart';

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DSSpacing.sm.horizontal,  // 8.w
        vertical: DSSpacing.md.vertical,      // 12.h
      ),
      child: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DSSpacing.sm.horizontal,  // 8.w
            vertical: DSSpacing.md.vertical,      // 12.h
          ),
          child: GestureDetector(
            onTap: onBackPressed ?? () => Navigator.of(context).pop(),
            child: hideIcon
                ? const SizedBox.shrink()
                : Container(
                    height: DSSize.smallButtonHeight,        // 32.h
                    width: DSSize.smallButtonHeight,         // 32.w
                    decoration: BoxDecoration(
                      borderRadius: DSRadius.sm,             // 8.r
                      border: Border.all(
                        width: 1.w,
                        color: borderColor ?? const Color(0xffDFE2E6),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: DSSize.iconSm,                 // 20.sp
                        color: iconColor ?? const Color(0xff303136),
                      ),
                    ),
                  ),
          ),
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
                    right: DSSpacing.sm.horizontal,  // 8.w
                  ),
                  child: endWidget!,
                ),
              ]
            : null,
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
/// // Basic usage
/// AppAppBar(
///   title: 'Settings',
/// )
/// 
/// // With custom back action
/// AppAppBar(
///   title: 'Profile',
///   onBackPressed: () => print('Custom back'),
/// )
/// 
/// // Hide back button
/// AppAppBar(
///   title: 'Home',
///   hideIcon: true,
/// )
/// 
/// // With end widget
/// AppAppBar(
///   title: 'Messages',
///   endWidget: IconButton(
///     icon: Icon(Icons.more_vert),
///     onPressed: () {},
///   ),
/// )
/// 
/// // Using copyWith for customization
/// final baseAppBar = AppAppBar(title: 'Base');
/// final darkAppBar = baseAppBar.copyWith(
///   titleColor: Colors.white,
///   backgroundColor: Colors.black87,
///   iconColor: Colors.white,
///   borderColor: Colors.white24,
/// );
/// 
/// // Fully customized
/// AppAppBar(
///   title: 'Custom',
///   titleColor: Colors.blue,
///   iconColor: Colors.blue,
///   borderColor: Colors.blue.shade200,
///   backgroundColor: Colors.blue.shade50,
/// )