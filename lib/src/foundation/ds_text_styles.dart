import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// DSTextStyles - Design System Text Styles
/// Centralized text styles for consistent typography across the app
abstract final class DSTextStyles {
  DSTextStyles._();
  
  static String? _fontFamily;
  static bool _isInitialized = false;
  
  /// Initialize DSTextStyles with the font from MaterialApp theme
  /// Call this ONCE in your app
  static void initialize(BuildContext context) {
    if (_isInitialized) return;
    
    try {
      final themeFontFamily = Theme.of(context).textTheme.bodyLarge?.fontFamily;
      if (themeFontFamily != null && themeFontFamily.isNotEmpty) {
        _fontFamily = themeFontFamily;
      }
      _isInitialized = true;
    } catch (e) {
      debugPrint('DSTextStyles: Could not read theme font: $e');
      _isInitialized = true;
    }
  }
  
  static String? get fontFamily => _fontFamily;
  static bool get isInitialized => _isInitialized;
  
  // Base style with font family
  static TextStyle get _baseStyle => TextStyle(fontFamily: _fontFamily);
  
  // === TEXT STYLES ===
  
  static TextStyle get pageTitle => _baseStyle.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  
  static TextStyle get sectionHeader => _baseStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  
  static TextStyle get subheader => _baseStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  
  static TextStyle get body => _baseStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static TextStyle get label => _baseStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  
  static TextStyle get caption => _baseStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  
  static TextStyle get button => _baseStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  
  static TextStyle get bottomSheetTitle => _baseStyle.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  
  static TextStyle get bottomSheetDescription => _baseStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );
  
  static TextStyle get formField => _baseStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  
  static TextStyle get hint => _baseStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  
  static TextStyle get error => _baseStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}

extension DSFontExtension on BuildContext {
  String? get dsFont => DSTextStyles.fontFamily;
}

/// ============================================
/// USAGE EXAMPLES:
/// ============================================
/// 
/// ========================================
/// SETUP (ONE-TIME):
/// ========================================
/// 
/// // Method 1: Initialize in MaterialApp
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       theme: ThemeData(
///         fontFamily: 'Cairo', // Optional custom font
///       ),
///       home: Builder(
///         builder: (context) {
///           DSTextStyles.initialize(context);
///           return HomeScreen();
///         },
///       ),
///     );
///   }
/// }
/// 
/// // Method 2: Initialize in first screen
/// class HomeScreen extends StatefulWidget {
///   @override
///   State<HomeScreen> createState() => _HomeScreenState();
/// }
/// 
/// class _HomeScreenState extends State<HomeScreen> {
///   @override
///   void initState() {
///     super.initState();
///     WidgetsBinding.instance.addPostFrameCallback((_) {
///       DSTextStyles.initialize(context);
///     });
///   }
///   
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Column(
///         children: [
///           Text('Title', style: DSTextStyles.pageTitle),
///           Text('Body', style: DSTextStyles.body),
///         ],
///       ),
///     );
///   }
/// }
/// 
/// // Method 3: No initialization (uses platform defaults)
/// class HomeScreen extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Text('Hello', style: DSTextStyles.body);
///   }
/// }
/// 
/// ========================================
/// USAGE IN WIDGETS:
/// ========================================
/// 
/// // Basic usage
/// Text('Page Title', style: DSTextStyles.pageTitle)
/// Text('Section Header', style: DSTextStyles.sectionHeader)
/// Text('Body text', style: DSTextStyles.body)
/// Text('Caption', style: DSTextStyles.caption)
/// 
/// // With color override
/// Text(
///   'Red Title',
///   style: DSTextStyles.pageTitle.copyWith(color: Colors.red),
/// )
/// 
/// // With multiple overrides
/// Text(
///   'Custom',
///   style: DSTextStyles.body.copyWith(
///     color: Colors.blue,
///     fontSize: 16.sp,
///     fontWeight: FontWeight.bold,
///   ),
/// )
/// 
/// // Button
/// ElevatedButton(
///   onPressed: () {},
///   child: Text('Submit', style: DSTextStyles.button),
/// )
/// 
/// // Form field
/// TextFormField(
///   style: DSTextStyles.formField,
///   decoration: InputDecoration(
///     hintText: 'Enter text',
///     hintStyle: DSTextStyles.hint,
///     errorStyle: DSTextStyles.error,
///   ),
/// )
/// 
/// // Bottom sheet
/// showModalBottomSheet(
///   context: context,
///   builder: (context) => Column(
///     children: [
///       Text('Title', style: DSTextStyles.bottomSheetTitle),
///       Text('Description', style: DSTextStyles.bottomSheetDescription),
///     ],
///   ),
/// )
/// 
/// // Custom style with extension
/// Text(
///   'Custom',
///   style: TextStyle(
///     fontSize: 20.sp,
///     fontFamily: context.dsFont,
///     fontWeight: FontWeight.w700,
///   ),
/// )
/// 
/// ========================================
/// FOR PACKAGE (README.md):
/// ========================================
/// 
/// # DSTextStyles
/// 
/// Scalable typography system for Flutter with automatic theme integration.
/// 
/// ## Features
/// 
/// - ✅ Automatic platform fonts (Roboto/SF Pro)
/// - ✅ MaterialApp theme integration
/// - ✅ High performance (one-time lookup)
/// - ✅ Clean API (no context in widgets)
/// - ✅ Zero font assets required
/// 
/// ## Quick Start
/// 
/// ```dart
/// // 1. Initialize once in your app
/// MaterialApp(
///   theme: ThemeData(fontFamily: 'Cairo'), // Optional
///   home: Builder(
///     builder: (context) {
///       DSTextStyles.initialize(context);
///       return HomeScreen();
///     },
///   ),
/// )
/// 
/// // 2. Use anywhere
/// Text('Hello', style: DSTextStyles.body)
/// ```
/// 
/// ## Available Styles
/// 
/// - `pageTitle` (20sp, w700)
/// - `sectionHeader` (16sp, w700)
/// - `subheader` (14sp, w600)
/// - `body` (14sp, w400)
/// - `label` (12sp, w500)
/// - `caption` (12sp, w400)
/// - `button` (16sp, w600)
/// - `bottomSheetTitle` (18sp, w600)
/// - `bottomSheetDescription` (14sp, w400)
/// - `formField` (14sp, w400)
/// - `hint` (14sp, w400)
/// - `error` (12sp, w400)