import 'package:flutter/material.dart';

/// DSColorExtensions - Color manipulation utilities
/// Works perfectly with the static DSColors system
/// 
/// Usage:
/// ```dart
/// DSColors.primary.lighten(0.2)
/// DSColors.secondary.glass()
/// Color(0xFF0D9488).softShadow()
/// ```
extension DSColorExtensions on Color {
  
  // ========== COLOR MANIPULATION ==========
  
  /// Lighten the color by [amount] (0.0 to 1.0)
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }
  
  /// Darken the color by [amount] (0.0 to 1.0)
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }
  
  /// Increase saturation
  Color saturate([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withSaturation((hsl.saturation + amount).clamp(0.0, 1.0)).toColor();
  }
  
  /// Decrease saturation
  Color desaturate([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withSaturation((hsl.saturation - amount).clamp(0.0, 1.0)).toColor();
  }
  
  // ========== GLASS EFFECTS ==========
  
  /// Glass/frosted effect
  Color glass({double opacity = 0.7, bool tinted = true}) {
    return tinted ? withOpacity(opacity * 0.85) : withOpacity(opacity);
  }
  
  /// Frosted glass effect (more blur, less opacity)
  Color frosted() => glass(opacity: 0.5, tinted: true);
  
  /// Light glass effect
  Color glassLight() => glass(opacity: 0.3, tinted: false);
  
  /// Dark glass effect
  Color glassDark() => glass(opacity: 0.9, tinted: true);
  
  // ========== OVERLAY COLORS ==========
  
  /// Overlay color for modals, bottom sheets
  Color overlay([double opacity = 0.5]) => Colors.black.withOpacity(opacity);
  
  /// Modal backdrop
  Color modal() => Colors.black.withOpacity(0.5);
  
  /// Light overlay
  Color overlayLight() => Colors.black.withOpacity(0.3);
  
  /// Dark overlay
  Color overlayDark() => Colors.black.withOpacity(0.7);
  
  /// Shimmer effect color
  Color shimmer() => withOpacity(0.3);
  
  /// Skeleton loader color
  Color skeleton() => withOpacity(0.15);
  
  // ========== SHADOWS ==========
  
  /// Soft shadow (subtle depth)
  List<BoxShadow> softShadow() {
    return [
      BoxShadow(
        color: withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ];
  }
  
  /// Medium shadow (standard cards)
  List<BoxShadow> mediumShadow() {
    return [
      BoxShadow(
        color: withOpacity(0.15),
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ];
  }
  
  /// Hard shadow (elevated elements)
  List<BoxShadow> hardShadow() {
    return [
      BoxShadow(
        color: withOpacity(0.2),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ];
  }
  
  /// Colored shadow (modern design)
  List<BoxShadow> coloredShadow({double opacity = 0.3}) {
    return [
      BoxShadow(
        color: withOpacity(opacity),
        blurRadius: 20,
        offset: const Offset(0, 10),
        spreadRadius: -5,
      ),
    ];
  }
  
  /// Glowing shadow (neon effect)
  List<BoxShadow> glowingShadow() {
    return [
      BoxShadow(
        color: withOpacity(0.5),
        blurRadius: 30,
        spreadRadius: 5,
      ),
    ];
  }
  
  // ========== ACCESSIBILITY ==========
  
  /// Get appropriate text color (black or white) for this background
  Color get onColor => computeLuminance() > 0.5 ? Colors.black : Colors.white;
  
  /// Check if color is light
  bool get isLight => computeLuminance() > 0.5;
  
  /// Check if color is dark
  bool get isDark => !isLight;
  
  /// Get WCAG contrast ratio with another color
  double contrastRatio(Color other) {
    final l1 = computeLuminance();
    final l2 = other.computeLuminance();
    final lighter = l1 > l2 ? l1 : l2;
    final darker = l1 > l2 ? l2 : l1;
    return (lighter + 0.05) / (darker + 0.05);
  }
  
  /// Check if this color has good contrast with another (WCAG AA)
  bool hasGoodContrast(Color other) => contrastRatio(other) >= 4.5;
  
  // ========== GRADIENTS ==========
  
  /// Linear gradient to another color
  LinearGradient linearGradientTo(
    Color endColor, {
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [this, endColor],
    );
  }
  
  /// Shimmer gradient effect
  LinearGradient shimmerGradient() {
    final light = lighten(0.3);
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        withOpacity(0.1),
        light.withOpacity(0.3),
        withOpacity(0.1),
      ],
      stops: const [0.0, 0.5, 1.0],
    );
  }
  
  /// Glass gradient (for glassmorphism)
  LinearGradient glassGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        withOpacity(0.7),
        withOpacity(0.3),
      ],
    );
  }
  
  // ========== UTILITIES ==========
  
  /// Convert to hex string
  String toHex({bool includeAlpha = false}) {
    if (includeAlpha) {
      return '#${alpha.toRadixString(16).padLeft(2, '0')}'
          '${red.toRadixString(16).padLeft(2, '0')}'
          '${green.toRadixString(16).padLeft(2, '0')}'
          '${blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase();
    }
    return '#${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase();
  }
  
  /// Blend with another color
  Color blend(Color other, [double amount = 0.5]) {
    return Color.lerp(this, other, amount)!;
  }
}

/// String to Color conversion
extension DSStringToColor on String {
  /// Convert string to Color
  /// Supports: #RGB, #RRGGBB, #AARRGGBB, rgb(), rgba()
  Color toColor() {
    try {
      String colorString = trim();
      
      // Handle rgb/rgba format
      if (colorString.startsWith('rgb')) {
        final regex = RegExp(r'rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*([\d.]+))?\)');
        final match = regex.firstMatch(colorString);
        
        if (match != null) {
          final r = int.parse(match.group(1)!);
          final g = int.parse(match.group(2)!);
          final b = int.parse(match.group(3)!);
          final a = match.group(4) != null 
              ? (double.parse(match.group(4)!) * 255).round()
              : 255;
          return Color.fromARGB(a, r, g, b);
        }
      }
      
      // Handle hex format
      if (colorString.startsWith('#')) {
        colorString = colorString.substring(1);
      }
      
      // Handle short hex (RGB -> RRGGBB)
      if (colorString.length == 3) {
        colorString = colorString.split('').map((c) => c + c).join();
      }
      
      // Add alpha if not present
      if (colorString.length == 6) {
        colorString = 'FF$colorString';
      }
      
      return Color(int.parse(colorString, radix: 16));
    } catch (e) {
      return Colors.grey;
    }
  }
  
  /// Quick access
  Color get color => toColor();
  
  /// Figma workflow alias
  Color get figma => toColor();
}

/// ============================================================================
/// USAGE EXAMPLES WITH STATIC DSCOLORS
/// ============================================================================

/// Example 1: Manipulate DSColors
/// ```dart
/// Container(
///   color: DSColors.primary.lighten(0.2),
///   child: Text(
///     'Hello',
///     style: TextStyle(color: DSColors.primary.onColor),
///   ),
/// )
/// ```

/// Example 2: Glass effects
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     color: DSColors.surface.glass(),
///     borderRadius: BorderRadius.circular(20),
///   ),
/// )
/// ```

/// Example 3: Shadows
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     color: DSColors.surface,
///     boxShadow: DSColors.primary.softShadow(),
///   ),
/// )
/// ```

/// Example 4: String parsing
/// ```dart
/// Container(
///   color: '#0D9488'.toColor(),
///   // or shorter
///   color: '#0D9488'.color,
/// )
/// ```

/// Example 5: Gradients
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     gradient: DSColors.primary.linearGradientTo(DSColors.secondary),
///   ),
/// )
/// ```

/// Example 6: Accessibility
/// ```dart
/// final bgColor = DSColors.primary;
/// final textColor = bgColor.onColor; // Auto white or black
/// 
/// if (bgColor.hasGoodContrast(Colors.white)) {
///   // Use white text
/// }
/// ```

/// Example 7: Dynamic color generation
/// ```dart
/// class AppColors extends ColorSource {
///   @override
///   Color get primary => const Color(0xFF0D9488);
///   
///   @override
///   Color get primaryLight => primary.lighten(0.2);
///   
///   @override
///   Color get primaryDark => primary.darken(0.2);
///   
///   @override
///   Color get borderFocused => primary.lighten(0.1);
/// }
/// ```