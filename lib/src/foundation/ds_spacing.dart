import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// DSSpacing - Design System Spacing
/// Easy-to-remember naming: xsm, sm, md, lg, xlg, xxlg
enum DSSpacing {
  xsm(4),   // Extra small - rare use
  sm(8),    // Small - tight spacing
  md(12),   // Medium - standard spacing
  lg(16),   // Large - section spacing
  xlg(20),  // Extra large - screen padding
  xxlg(24), // Double extra large - major breaks
  xxxlg(32); // Triple extra large - very major breaks

  const DSSpacing(this.value);
  final double value;

  // Horizontal spacing
  double get horizontal => value.w;
  
  // Vertical spacing
  double get vertical => value.h;
  
  // All sides spacing
  EdgeInsets get all => EdgeInsets.all(value.w);
  
  // Symmetric spacing
  EdgeInsets symmetric({bool horizontal = false, bool vertical = false}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal ? value.w : 0,
      vertical: vertical ? value.h : 0,
    );
  }
}

/// EdgeInsetsDirectional extensions for common patterns
extension DSEdgeInsets on EdgeInsets {
  // Screen level padding
  static EdgeInsets get screen => EdgeInsets.symmetric(
    horizontal: DSSpacing.xlg.horizontal,
    vertical: DSSpacing.xlg.vertical,
  );
  
  // Safe area top
  static EdgeInsets get topSafe => EdgeInsets.only(top: DSSpacing.xlg.vertical);
  
  // Safe area bottom
  static EdgeInsets get bottomSafe => EdgeInsets.only(bottom: DSSpacing.xlg.vertical);
  
  // Container padding (12w × 8h)
  static EdgeInsets get container => EdgeInsets.symmetric(
    horizontal: DSSpacing.md.horizontal,
    vertical: DSSpacing.sm.vertical,
  );
  
  // List item padding (12w × 12h)
  static EdgeInsets get listItem => EdgeInsets.all(DSSpacing.md.value.w);
  
  // Button padding (16w × 12h)
  static EdgeInsets get button => EdgeInsets.symmetric(
    horizontal: DSSpacing.lg.horizontal,
    vertical: DSSpacing.md.vertical,
  );
  
  // Card padding (16w × 12h)
  static EdgeInsets get card => EdgeInsets.symmetric(
    horizontal: DSSpacing.lg.horizontal,
    vertical: DSSpacing.md.vertical,
  );
  
  // Form field content padding (16w × 14h)
  static EdgeInsets get formField => EdgeInsets.symmetric(
    horizontal: DSSpacing.lg.horizontal,
    vertical: 14.h,
  );
  
  // Bottom sheet padding
  static EdgeInsets get bottomSheet => EdgeInsets.symmetric(
    horizontal: DSSpacing.xlg.horizontal,
    vertical: DSSpacing.xlg.vertical,
  );
}

/// Vertical spacing widgets
class DSVSpace {
  static SizedBox get xsm => SizedBox(height: DSSpacing.xsm.vertical);
  static SizedBox get sm => SizedBox(height: DSSpacing.sm.vertical);
  static SizedBox get md => SizedBox(height: DSSpacing.md.vertical);
  static SizedBox get lg => SizedBox(height: DSSpacing.lg.vertical);
  static SizedBox get xlg => SizedBox(height: DSSpacing.xlg.vertical);
  static SizedBox get xxlg => SizedBox(height: DSSpacing.xxlg.vertical);
  static SizedBox get xxxlg => SizedBox(height: DSSpacing.xxxlg.vertical);
}

/// Horizontal spacing widgets
class DSHSpace {
  static SizedBox get xsm => SizedBox(width: DSSpacing.xsm.horizontal);
  static SizedBox get sm => SizedBox(width: DSSpacing.sm.horizontal);
  static SizedBox get md => SizedBox(width: DSSpacing.md.horizontal);
  static SizedBox get lg => SizedBox(width: DSSpacing.lg.horizontal);
  static SizedBox get xlg => SizedBox(width: DSSpacing.xlg.horizontal);
  static SizedBox get xxlg => SizedBox(width: DSSpacing.xxlg.horizontal);
  static SizedBox get xxxlg => SizedBox(width: DSSpacing.xxxlg.horizontal);
}

/// Usage examples:
/// 
/// Padding(
///   padding: DSEdgeInsets.screen,
///   child: Column(
///     children: [
///       Text('Title'),
///       DSVSpace.xlg,  // 20.h gap
///       Text('Content'),
///       DSVSpace.md,   // 12.h gap
///       Row(
///         children: [
///           Icon(Icons.person),
///           DSHSpace.md,  // 12.w gap
///           Text('Name'),
///         ],
///       ),
///     ],
///   ),
/// )