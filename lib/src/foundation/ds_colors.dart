import 'package:flutter/material.dart';

/// DSColors - Design System Colors
///
/// Provides default colors that can be overridden by package users.
/// Uses a configurable color scheme pattern.
///
/// Usage:
/// ```dart
/// // Use defaults
/// Container(color: DSColors.primary)
///
/// // Initialize with custom colors
/// DSColors.initialize(
///   primary: Color(0xFF0D9488),
///   secondary: Color(0xFFFF4893),
/// );
///
/// // Or use theme-based approach
/// DSColors.fromTheme(context)
/// ```
class DSColors {
  DSColors._();

  // Singleton instance
  static DSColorScheme _scheme = DSColorScheme.defaultScheme();

  /// Initialize with custom colors (call once at app start)
  static void initialize({
    Color? primary,
    Color? primaryLight,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? success,
    Color? warning,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    LinearGradient? primaryGradient,
    LinearGradient? headerGradient,
  }) {
    _scheme = DSColorScheme(
      primary: primary ?? _scheme.primary,
      primaryLight: primaryLight ?? _scheme.primaryLight,
      secondary: secondary ?? _scheme.secondary,
      background: background ?? _scheme.background,
      surface: surface ?? _scheme.surface,
      error: error ?? _scheme.error,
      success: success ?? _scheme.success,
      warning: warning ?? _scheme.warning,
      textPrimary: textPrimary ?? _scheme.textPrimary,
      textSecondary: textSecondary ?? _scheme.textSecondary,
      border: border ?? _scheme.border,
      primaryGradient: primaryGradient ?? _scheme.primaryGradient,
      headerGradient: headerGradient ?? _scheme.headerGradient,
    );
  }

  /// Reset to default colors
  static void resetToDefaults() {
    _scheme = DSColorScheme.defaultScheme();
  }

  /// Get current color scheme
  static DSColorScheme get scheme => _scheme;

  // Primary Colors
  static Color get primary => _scheme.primary;
  static Color get primaryLight => _scheme.primaryLight;
  static Color get primaryDark => _scheme.primaryDark;

  // Secondary Colors
  static Color get secondary => _scheme.secondary;
  static Color get secondaryLight => _scheme.secondaryLight;

  // Background Colors
  static Color get background => _scheme.background;
  static Color get surface => _scheme.surface;
  static Color get surfaceVariant => _scheme.surfaceVariant;

  // Text Colors
  static Color get textPrimary => _scheme.textPrimary;
  static Color get textSecondary => _scheme.textSecondary;
  static Color get textTertiary => _scheme.textTertiary;
  static Color get textDisabled => _scheme.textDisabled;
  static Color get textOnPrimary => _scheme.textOnPrimary;

  // Border Colors
  static Color get border => _scheme.border;
  static Color get borderFocused => _scheme.borderFocused;

  // Status Colors
  static Color get success => _scheme.success;
  static Color get warning => _scheme.warning;
  static Color get error => _scheme.error;
  static Color get info => _scheme.info;

  // Special Colors
  static Color get disabled => _scheme.disabled;
  static Color get overlay => _scheme.overlay;
  static Color get divider => _scheme.divider;

  // Gradients
  static LinearGradient get primaryGradient => _scheme.primaryGradient;
  static LinearGradient get headerGradient => _scheme.headerGradient;
  static LinearGradient get progressGradient => _scheme.progressGradient;

  // Context-based access (gets from Theme if available)
  static DSColorScheme fromContext(BuildContext context) {
    final theme = Theme.of(context);
    return DSColorScheme(
      primary: theme.primaryColor,
      secondary: theme.colorScheme.secondary,
      background: theme.scaffoldBackgroundColor,
      surface: theme.cardColor,
      error: theme.colorScheme.error,
      textPrimary: theme.textTheme.bodyLarge?.color ?? _scheme.textPrimary,
      textSecondary: theme.textTheme.bodyMedium?.color ?? _scheme.textSecondary,
      border: theme.buttonTheme.colorScheme?.outline ?? _scheme.border,
      success: theme.bannerTheme.surfaceTintColor ?? _scheme.success,
      warning: theme.bannerTheme.surfaceTintColor ?? _scheme.warning,
    );
  }
}

/// DSColorScheme - Color scheme container
class DSColorScheme {
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color secondary;
  final Color secondaryLight;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textOnPrimary;
  final Color border;
  final Color borderFocused;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color disabled;
  final Color overlay;
  final Color divider;
  final LinearGradient primaryGradient;
  final LinearGradient headerGradient;
  final LinearGradient progressGradient;

  DSColorScheme({
    required this.primary,
    Color? primaryLight,
    Color? primaryDark,
    required this.secondary,
    Color? secondaryLight,
    required this.background,
    required this.surface,
    Color? surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textOnPrimary,
    required this.border,
    Color? borderFocused,
    required this.success,
    required this.warning,
    required this.error,
    Color? info,
    Color? disabled,
    Color? overlay,
    Color? divider,
    LinearGradient? primaryGradient,
    LinearGradient? headerGradient,
    LinearGradient? progressGradient,
  }) : primaryLight = primaryLight ?? _lighten(primary, 0.2),
       primaryDark = primaryDark ?? _darken(primary, 0.2),
       secondaryLight = secondaryLight ?? _lighten(secondary, 0.2),
       surfaceVariant = surfaceVariant ?? _lighten(surface, 0.05),
       textTertiary = textTertiary ?? textSecondary.withOpacity(0.6),
       textDisabled = textDisabled ?? textSecondary.withOpacity(0.38),
       textOnPrimary = textOnPrimary ?? Colors.white,
       borderFocused = borderFocused ?? primary,
       info = info ?? const Color(0xFF74B9FF),
       disabled = disabled ?? const Color(0xFFCED7E3),
       overlay = overlay ?? Colors.black.withOpacity(0.5),
       divider = divider ?? border.withOpacity(0.12),
       primaryGradient =
           primaryGradient ??
           LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             colors: [primaryLight ?? _lighten(primary, 0.2), primary],
           ),
       headerGradient =
           headerGradient ??
           LinearGradient(
             begin: const Alignment(-0.15, -1.0),
             end: const Alignment(1.0, 1.0),
             colors: [primary, secondary],
           ),
       progressGradient =
           progressGradient ??
           LinearGradient(
             colors: [primaryLight ?? _lighten(primary, 0.2), primary],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           );

  /// Default color scheme (your current app colors)
  factory DSColorScheme.defaultScheme() {
    return DSColorScheme(
      // Primary
      primary: Color(0xFF0D9488),
      primaryLight: Color(0xFF4FBFB4),
      primaryDark: Color(0xFF0A7A72),

      // Secondary
      secondary: Color(0xFFFF4893),
      secondaryLight: Color(0xFFFF78B0),

      // Background
      background: Color(0xFFF2F8F7),
      surface: Color(0xFFF6FEFD),
      surfaceVariant: Color(0xFFFFFFFF),

      // Text
      textPrimary: Color(0xFF424B59),
      textSecondary: Color(0xFF6E7C91),
      textTertiary: Color(0xFFB5BCC4),
      textOnPrimary: Color(0xFFFFFFFF),

      // Border
      border: Color(0xFFCED7E3),
      borderFocused: Color(0xFF0D9488),

      // Status
      success: Color(0xFF0D9488),
      warning: Color(0xFFF9C323),
      error: Color(0xFFFF6B6B),
      info: Color(0xFF74B9FF),

      // Special
      disabled: Color(0xFFCED7E3),

      // Gradients
      primaryGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4FBFB4), Color(0xFF0D9488)],
      ),
      headerGradient: LinearGradient(
        begin: Alignment(-0.15, -1.0),
        end: Alignment(1.0, 1.0),
        colors: [Color(0xFF0D9488), Color(0xFFFAC642)],
      ),
    );
  }

  /// Create light theme variant
  factory DSColorScheme.light({Color? primary, Color? secondary}) {
    final p = primary ?? const Color(0xFF0D9488);
    final s = secondary ?? const Color(0xFFFF4893);

    return DSColorScheme(
      primary: p,
      secondary: s,
      background: const Color(0xFFF2F8F7),
      surface: const Color(0xFFFFFFFF),
      textPrimary: const Color(0xFF424B59),
      textSecondary: const Color(0xFF6E7C91),
      border: const Color(0xFFCED7E3),
      success: p,
      warning: const Color(0xFFF9C323),
      error: const Color(0xFFFF6B6B),
    );
  }

  /// Create dark theme variant
  factory DSColorScheme.dark({Color? primary, Color? secondary}) {
    final p = primary ?? const Color(0xFF4FBFB4);
    final s = secondary ?? const Color(0xFFFF78B0);

    return DSColorScheme(
      primary: p,
      secondary: s,
      background: const Color(0xFF121212),
      surface: const Color(0xFF1E1E1E),
      textPrimary: const Color(0xFFFFFFFF),
      textSecondary: const Color(0xFFB0B0B0),
      border: const Color(0xFF3A3A3A),
      success: p,
      warning: const Color(0xFFFAC642),
      error: const Color(0xFFFF8A8A),
    );
  }

  /// copyWith method for customization
  DSColorScheme copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? secondary,
    Color? secondaryLight,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textOnPrimary,
    Color? border,
    Color? borderFocused,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? disabled,
    Color? overlay,
    Color? divider,
    LinearGradient? primaryGradient,
    LinearGradient? headerGradient,
    LinearGradient? progressGradient,
  }) {
    return DSColorScheme(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      border: border ?? this.border,
      borderFocused: borderFocused ?? this.borderFocused,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      disabled: disabled ?? this.disabled,
      overlay: overlay ?? this.overlay,
      divider: divider ?? this.divider,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      headerGradient: headerGradient ?? this.headerGradient,
      progressGradient: progressGradient ?? this.progressGradient,
    );
  }

  // Helper methods to lighten/darken colors
  static Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  static Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}

/// Extension on BuildContext for easy color access
extension DSColorsContext on BuildContext {
  DSColorScheme get colors => DSColors.scheme;

  Color get primaryColor => DSColors.primary;
  Color get secondaryColor => DSColors.secondary;
  Color get backgroundColor => DSColors.background;
  Color get textColor => DSColors.textPrimary;
}

/// Predefined color palettes for common use cases
class DSColorPalettes {
  DSColorPalettes._();

  /// Green/Teal theme (default)
  static DSColorScheme get teal => DSColorScheme.defaultScheme();

  /// Blue theme
  static DSColorScheme get blue => DSColorScheme.light(
    primary: const Color(0xFF2196F3),
    secondary: const Color(0xFFFF9800),
  );

  /// Purple theme
  static DSColorScheme get purple => DSColorScheme.light(
    primary: const Color(0xFF9C27B0),
    secondary: const Color(0xFF00BCD4),
  );

  /// Red theme
  static DSColorScheme get red => DSColorScheme.light(
    primary: const Color(0xFFE91E63),
    secondary: const Color(0xFF3F51B5),
  );

  /// Orange theme
  static DSColorScheme get orange => DSColorScheme.light(
    primary: const Color(0xFFFF5722),
    secondary: const Color(0xFF4CAF50),
  );

  /// Dark teal theme
  static DSColorScheme get tealDark => DSColorScheme.dark(
    primary: const Color(0xFF4FBFB4),
    secondary: const Color(0xFFFF78B0),
  );
}

/// Usage Examples:
/// 
/// // 1. Use default colors (in package)
/// Container(
///   color: DSColors.primary,
///   child: Text(
///     'Hello',
///     style: TextStyle(color: DSColors.textOnPrimary),
///   ),
/// )
/// 
/// // 2. Initialize with custom colors (in app's main.dart)
/// void main() {
///   DSColors.initialize(
///     primary: Color(0xFF0D9488),
///     secondary: Color(0xFFFF4893),
///     background: Color(0xFFF2F8F7),
///   );
///   runApp(MyApp());
/// }
/// 
/// // 3. Use predefined palettes
/// DSColors.initialize(scheme: DSColorPalettes.blue);
/// 
/// // 4. Context extension
/// Container(
///   color: context.primaryColor,
/// )
/// 
/// // 5. Use in widgets with copyWith
/// final customButton = CustomButton(
///   label: 'Click',
///   onPressed: () {},
/// ).copyWith(
///   backgroundColor: DSColors.secondary,
/// );
/// 
/// // 6. Create custom scheme
/// final myScheme = DSColorScheme.light(
///   primary: Color(0xFF0D9488),
///   secondary: Color(0xFFFF4893),
/// ).copyWith(
///   success: Color(0xFF00C853),
/// );
/// 
/// DSColors.initialize(scheme: myScheme);