import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class DSSize {
  // === BUTTON HEIGHTS ===
  static double get buttonHeight => 48.h;
  static double get smallButtonHeight => 32.h;
  static double get iconButtonSize => 44.h;
  
  // === TOUCH TARGETS (minimum 44x44) ===
  static double get minTouchTarget => 44.h;
  
  // === ICON SIZES ===
  static double get iconXs => 16.sp;
  static double get iconSm => 20.sp;
  static double get iconMd => 24.sp;
  static double get iconLg => 32.sp;
  static double get iconXl => 40.sp;
  
  // === AVATAR/CIRCLE SIZES ===
  static double get avatarSm => 32.w;
  static double get avatarMd => 48.w;
  static double get avatarLg => 64.w;
  static double get avatarXl => 80.w;
  
  // === BORDER RADIUS ===
  static double get radiusSm => 8.r;
  static double get radiusMd => 12.r;
  static double get radiusLg => 16.r;
  static double get radiusXl => 20.r;
  static double get radiusPill => 24.r;
  static double get radiusFull => 999.r;
  
  // === FORM FIELD SIZES ===
  static double get formFieldHeight => 48.h;
  static double get formFieldIconSize => 20.w;
}

/// SizedBox helpers for common sizes
class DSSizedBox {
  // Button sizes
  static SizedBox get button => SizedBox(height: DSSize.buttonHeight);
  static SizedBox get smallButton => SizedBox(height: DSSize.smallButtonHeight);
  
  // Icon sizes
  static SizedBox iconXs() => SizedBox.square(dimension: DSSize.iconXs);
  static SizedBox iconSm() => SizedBox.square(dimension: DSSize.iconSm);
  static SizedBox iconMd() => SizedBox.square(dimension: DSSize.iconMd);
  static SizedBox iconLg() => SizedBox.square(dimension: DSSize.iconLg);
  static SizedBox iconXl() => SizedBox.square(dimension: DSSize.iconXl);
  
  // Avatar sizes
  static SizedBox avatarSm() => SizedBox.square(dimension: DSSize.avatarSm);
  static SizedBox avatarMd() => SizedBox.square(dimension: DSSize.avatarMd);
  static SizedBox avatarLg() => SizedBox.square(dimension: DSSize.avatarLg);
  static SizedBox avatarXl() => SizedBox.square(dimension: DSSize.avatarXl);
}

/// BorderRadius helpers
class DSRadius {
  static BorderRadius get sm => BorderRadius.circular(DSSize.radiusSm);
  static BorderRadius get md => BorderRadius.circular(DSSize.radiusMd);
  static BorderRadius get lg => BorderRadius.circular(DSSize.radiusLg);
  static BorderRadius get xl => BorderRadius.circular(DSSize.radiusXl);
  static BorderRadius get pill => BorderRadius.circular(DSSize.radiusPill);
  static BorderRadius get full => BorderRadius.circular(DSSize.radiusFull);
  
  // Top only
  static BorderRadius get topSm => BorderRadius.vertical(top: Radius.circular(DSSize.radiusSm));
  static BorderRadius get topMd => BorderRadius.vertical(top: Radius.circular(DSSize.radiusMd));
  static BorderRadius get topLg => BorderRadius.vertical(top: Radius.circular(DSSize.radiusLg));
  static BorderRadius get topXl => BorderRadius.vertical(top: Radius.circular(DSSize.radiusXl));
  
  // Bottom only
  static BorderRadius get bottomSm => BorderRadius.vertical(bottom: Radius.circular(DSSize.radiusSm));
  static BorderRadius get bottomMd => BorderRadius.vertical(bottom: Radius.circular(DSSize.radiusMd));
  static BorderRadius get bottomLg => BorderRadius.vertical(bottom: Radius.circular(DSSize.radiusLg));
  static BorderRadius get bottomXl => BorderRadius.vertical(bottom: Radius.circular(DSSize.radiusXl));
}
/// Usage examples:
/// 
/// // Button
/// SizedBox(
///   height: DSSize.buttonHeight,
///   child: ElevatedButton(...),
/// )
/// 
/// // Container with border radius
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: DSRadius.md,
///   ),
/// )
/// 
/// // Icon
/// Icon(
///   Icons.person,
///   size: DSSize.iconMd,
/// )
/// 
/// // Avatar
/// CircleAvatar(
///   radius: DSSize.avatarMd / 2,
/// )
