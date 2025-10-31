import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// DSTextStyles - Design System Text Styles
/// Centralized text styles for consistent typography across the app
abstract final class DSTextStyles {
  // Default font family for the app
  static const String _defaultFontFamily = 'Noto_Kufi_Arabic';
  
  // === PAGE TITLES (20.sp, w700) ===
  static TextStyle get pageTitle => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamily: _defaultFontFamily,
  );
  
  // === SECTION HEADERS (16.sp, w700) ===
  static TextStyle get sectionHeader => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamily: _defaultFontFamily,
  );
  
  // === SUBHEADERS (14.sp, w600) ===
  static TextStyle get subheader => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
    fontFamily: _defaultFontFamily,
  );
  
  // === BODY TEXT (14.sp, w400) ===
  static TextStyle get body => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    fontFamily: _defaultFontFamily,
  );
  
  // === LABEL TEXT (12.sp, w500) ===
  static TextStyle get label => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.4,
    fontFamily: _defaultFontFamily,
  );
  
  // === CAPTION (12.sp, w400) ===
  static TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    fontFamily: _defaultFontFamily,
  );
  
  // === BUTTON TEXT (16.sp, w600) ===
  static TextStyle get button => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.2,
    fontFamily: _defaultFontFamily,
  );
  
  // === BOTTOM SHEET SPECIFIC ===
  static TextStyle get bottomSheetTitle => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: 1.2,
    fontFamily: _defaultFontFamily,
  );
  
  static TextStyle get bottomSheetDescription => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.6,
    fontFamily: _defaultFontFamily,
  );
  
  // === FORM FIELD TEXT (14.sp, w400) ===
  static TextStyle get formField => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    fontFamily: _defaultFontFamily,
  );
  
  // === HINT TEXT (14.sp, w400) ===
  static TextStyle get hint => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    fontFamily: _defaultFontFamily,
  );
  
  // === ERROR TEXT (12.sp, w400) ===
  static TextStyle get error => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    fontFamily: _defaultFontFamily,
  );
}

/// Optional: Custom Text Widget for additional flexibility
/// Use this ONLY if you need extra features beyond standard Text widget

/// USAGE EXAMPLES:
/// 
/// // RECOMMENDED: Use DSTextStyles directly with Text widget
/// Text(
///   'Page Title',
///   style: DSTextStyles.pageTitle,
/// )
/// 
/// // Modify styles when needed
/// Text(
///   'Custom Color Title',
///   style: DSTextStyles.pageTitle.copyWith(color: Colors.blue),
/// )
/// 
/// // Use CustomAppText for quick overrides
/// CustomAppText(
///   'Quick text with color',
///   style: DSTextStyles.body,
///   color: Colors.red,
/// )
/// 
/// // Button text example
/// ElevatedButton(
///   child: Text('Submit', style: DSTextStyles.button),
///   onPressed: () {},
/// )