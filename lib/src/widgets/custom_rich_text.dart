import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../foundation/ds_text_styles.dart';

/// DSRichText - Design System RichText Widget
/// Simplifies RichText creation with consistent styling
class DSRichText extends StatelessWidget {
  final List<DSTextSpan> spans;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;

  const DSRichText({
    Key? key,
    required this.spans,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.softWrap = true,
    this.textDirection,
    this.strutStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: spans.map((span) => span.toTextSpan()).toList(),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      strutStyle: strutStyle,
    );
  }
}

/// DSTextSpan - Custom TextSpan with DSTextStyles integration
class DSTextSpan {
  final String text;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final List<DSTextSpan>? children;

  const DSTextSpan({
    required this.text,
    this.style,
    this.onTap,
    this.children,
  });

  /// Factory constructors for common styles
  factory DSTextSpan.pageTitle(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.pageTitle.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.sectionHeader(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.sectionHeader.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.subheader(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.subheader.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.body(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.body.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.label(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.label.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.caption(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.caption.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.button(
    String text, {
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.button.copyWith(color: color),
        onTap: onTap,
      );

  factory DSTextSpan.link(
    String text, {
    Color? color,
    required GestureTapCallback onTap,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.body.copyWith(
          color: color ?? Colors.blue,
          decoration: TextDecoration.underline,
        ),
        onTap: onTap,
      );

  factory DSTextSpan.bold(
    String text, {
    Color? color,
    double? fontSize,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.body.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: fontSize?.sp,
        ),
      );

  factory DSTextSpan.italic(
    String text, {
    Color? color,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.body.copyWith(
          color: color,
          fontStyle: FontStyle.italic,
        ),
      );

  factory DSTextSpan.underline(
    String text, {
    Color? color,
  }) =>
      DSTextSpan(
        text: text,
        style: DSTextStyles.body.copyWith(
          color: color,
          decoration: TextDecoration.underline,
        ),
      );

  TextSpan toTextSpan() {
    return TextSpan(
      text: text,
      style: style,
      recognizer: onTap != null
          ? (TapGestureRecognizer()..onTap = onTap)
          : null,
      children: children?.map((child) => child.toTextSpan()).toList(),
    );
  }
}

/// ============================================
/// USAGE EXAMPLES:
/// ============================================

/// ========================================
/// BASIC USAGE:
/// ========================================
/// 
/// // Simple rich text with different styles
/// DSRichText(
///   spans: [
///     DSTextSpan.body('Hello '),
///     DSTextSpan.bold('World', color: Colors.red),
///     DSTextSpan.body('!'),
///   ],
/// )
/// 
/// // Using factory constructors
/// DSRichText(
///   spans: [
///     DSTextSpan.sectionHeader('Title: '),
///     DSTextSpan.body('This is body text'),
///   ],
/// )
/// 
/// ========================================
/// WITH COLORS:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan.body('Normal text '),
///     DSTextSpan.body('Red text', color: Colors.red),
///     DSTextSpan.body(' and '),
///     DSTextSpan.bold('Bold blue', color: Colors.blue),
///   ],
/// )
/// 
/// ========================================
/// CLICKABLE LINKS:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan.body('By continuing, you agree to our '),
///     DSTextSpan.link(
///       'Terms of Service',
///       color: Colors.blue,
///       onTap: () {
///         print('Terms tapped');
///         // Navigate to terms page
///       },
///     ),
///     DSTextSpan.body(' and '),
///     DSTextSpan.link(
///       'Privacy Policy',
///       onTap: () => print('Privacy tapped'),
///     ),
///   ],
/// )
/// 
/// ========================================
/// MIXED STYLES:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan.pageTitle('Welcome!', color: Colors.black),
///     DSTextSpan.body('\n\nThis is '),
///     DSTextSpan.bold('important'),
///     DSTextSpan.body(' information. '),
///     DSTextSpan.italic('Please read carefully.'),
///   ],
///   maxLines: 5,
///   overflow: TextOverflow.ellipsis,
/// )
/// 
/// ========================================
/// CUSTOM STYLES:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan(
///       text: 'Custom styled text',
///       style: DSTextStyles.body.copyWith(
///         fontSize: 18.sp,
///         fontWeight: FontWeight.w600,
///         color: Colors.purple,
///         letterSpacing: 1.2,
///       ),
///     ),
///   ],
/// )
/// 
/// ========================================
/// FORM VALIDATION:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan(
///       text: '⚠ ',
///       style: DSTextStyles.error.copyWith(color: Colors.red),
///     ),
///     DSTextSpan(
///       text: 'This field is required',
///       style: DSTextStyles.error.copyWith(color: Colors.red),
///     ),
///   ],
/// )
/// 
/// ========================================
/// PRICING DISPLAY:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan.caption(
///       '\$',
///       color: Colors.grey[600],
///     ),
///     DSTextSpan(
///       text: '99',
///       style: DSTextStyles.pageTitle.copyWith(
///         fontSize: 32.sp,
///         fontWeight: FontWeight.w800,
///       ),
///     ),
///     DSTextSpan.caption(
///       '.99',
///       color: Colors.grey[600],
///     ),
///     DSTextSpan.caption(
///       '/month',
///       color: Colors.grey[600],
///     ),
///   ],
/// )
/// 
/// ========================================
/// READ MORE PATTERN:
/// ========================================
/// 
/// class ReadMoreExample extends StatefulWidget {
///   @override
///   State<ReadMoreExample> createState() => _ReadMoreExampleState();
/// }
/// 
/// class _ReadMoreExampleState extends State<ReadMoreExample> {
///   bool isExpanded = false;
///   
///   @override
///   Widget build(BuildContext context) {
///     return DSRichText(
///       spans: [
///         DSTextSpan.body(
///           isExpanded
///               ? 'This is a very long text that can be expanded...'
///               : 'This is a very long text...',
///         ),
///         DSTextSpan.link(
///           isExpanded ? ' Read less' : ' Read more',
///           color: Colors.blue,
///           onTap: () => setState(() => isExpanded = !isExpanded),
///         ),
///       ],
///       maxLines: isExpanded ? null : 2,
///       overflow: TextOverflow.ellipsis,
///     );
///   }
/// }
/// 
/// ========================================
/// NESTED CHILDREN:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan(
///       text: 'Parent text ',
///       style: DSTextStyles.body,
///       children: [
///         DSTextSpan.bold('with bold child'),
///         DSTextSpan(
///           text: ' and another child',
///           style: DSTextStyles.caption,
///         ),
///       ],
///     ),
///   ],
/// )
/// 
/// ========================================
/// HIGHLIGHTED TEXT:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan.body('Search results for '),
///     DSTextSpan(
///       text: 'flutter',
///       style: DSTextStyles.body.copyWith(
///         backgroundColor: Colors.yellow.withOpacity(0.3),
///         fontWeight: FontWeight.w600,
///       ),
///     ),
///   ],
/// )
/// 
/// ========================================
/// USER MENTIONS:
/// ========================================
/// 
/// DSRichText(
///   spans: [
///     DSTextSpan.body('Hey '),
///     DSTextSpan(
///       text: '@username',
///       style: DSTextStyles.body.copyWith(
///         color: Colors.blue,
///         fontWeight: FontWeight.w600,
///       ),
///       onTap: () => print('User tapped'),
///     ),
///     DSTextSpan.body(', check this out!'),
///   ],
/// )