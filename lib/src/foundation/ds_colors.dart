import 'package:flutter/material.dart';

/// DSColors - Zero-config static color system
/// 
/// Works out-of-the-box with defaults, easily overridable via AppColors.
/// No initialization, no setup, no runtime registration.
/// 
/// Usage:
/// ```dart
/// // Use defaults (zero-config)
/// Container(color: DSColors.primary)
/// 
/// // Override all colors via AppColors
/// class AppColors extends ColorSource {
///   @override Color get primary => Color(0xFF0D9488);
///   @override Color get secondary => Color(0xFFFF4893);
///   // ... override only what you need
/// }
/// ```
class DSColors {
  DSColors._();

  // Reference to color source (defaults to DefaultColors)
  static ColorSource _source = DefaultColors();

  /// Override colors by providing your own ColorSource implementation
  /// Call once before runApp() if needed
  static void setSource(ColorSource source) {
    _source = source;
  }

  // ========== PRIMARY COLORS ==========
  static Color get primary => _source.primary;
  static Color get primaryLight => _source.primaryLight;
  static Color get primaryDark => _source.primaryDark;

  // ========== SECONDARY COLORS ==========
  static Color get secondary => _source.secondary;
  static Color get secondaryLight => _source.secondaryLight;

  // ========== BACKGROUND COLORS ==========
  static Color get background => _source.background;
  static Color get surface => _source.surface;
  static Color get surfaceVariant => _source.surfaceVariant;

  // ========== TEXT COLORS ==========
  static Color get textPrimary => _source.textPrimary;
  static Color get textSecondary => _source.textSecondary;
  static Color get textTertiary => _source.textTertiary;
  static Color get textDisabled => _source.textDisabled;
  static Color get textOnPrimary => _source.textOnPrimary;

  // ========== BORDER COLORS ==========
  static Color get border => _source.border;
  static Color get borderFocused => _source.borderFocused;

  // ========== STATUS COLORS ==========
  static Color get success => _source.success;
  static Color get warning => _source.warning;
  static Color get error => _source.error;
  static Color get info => _source.info;

  // ========== SPECIAL COLORS ==========
  static Color get disabled => _source.disabled;
  static Color get overlay => _source.overlay;
  static Color get divider => _source.divider;

  // ========== GRADIENTS ==========
  static LinearGradient get primaryGradient => _source.primaryGradient;
  static LinearGradient get headerGradient => _source.headerGradient;
  static LinearGradient get progressGradient => _source.progressGradient;
}

/// ColorSource - Abstract interface for color providers
/// 
/// Implement this to create your custom color set.
/// All colors have default implementations for convenience.
abstract class ColorSource {
  // Primary Colors
  Color get primary => const Color(0xFF6366F1);
  Color get primaryLight => const Color(0xFF818CF8);
  Color get primaryDark => const Color(0xFF4F46E5);

  // Secondary Colors
  Color get secondary => const Color(0xFFEC4899);
  Color get secondaryLight => const Color(0xFFF472B6);

  // Background Colors
  Color get background => const Color(0xFFF9FAFB);
  Color get surface => const Color(0xFFFFFFFF);
  Color get surfaceVariant => const Color(0xFFF3F4F6);

  // Text Colors
  Color get textPrimary => const Color(0xFF1F2937);
  Color get textSecondary => const Color(0xFF6B7280);
  Color get textTertiary => const Color(0xFF9CA3AF);
  Color get textDisabled => const Color(0xFFD1D5DB);
  Color get textOnPrimary => const Color(0xFFFFFFFF);

  // Border Colors
  Color get border => const Color(0xFFD1D5DB);
  Color get borderFocused => primary;

  // Status Colors
  Color get success => const Color(0xFF10B981);
  Color get warning => const Color(0xFFF59E0B);
  Color get error => const Color(0xFFEF4444);
  Color get info => const Color(0xFF3B82F6);

  // Special Colors
  Color get disabled => const Color(0xFFE5E7EB);
  Color get overlay => Colors.black.withOpacity(0.5);
  Color get divider => const Color(0xFFE5E7EB);

  // Gradients
  LinearGradient get primaryGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primaryLight, primary],
      );

  LinearGradient get headerGradient => LinearGradient(
        begin: const Alignment(-0.15, -1.0),
        end: const Alignment(1.0, 1.0),
        colors: [primary, secondary],
      );

  LinearGradient get progressGradient => LinearGradient(
        colors: [primaryLight, primary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

/// DefaultColors - Package default color scheme
class DefaultColors extends ColorSource {
  // Uses all defaults from ColorSource
  // No overrides needed for neutral theme
}

/// Example: TealPinkColors - Custom color scheme
class TealPinkColors extends ColorSource {
  @override
  Color get primary => const Color(0xFF0D9488);

  @override
  Color get primaryLight => const Color(0xFF4FBFB4);

  @override
  Color get primaryDark => const Color(0xFF0A7A72);

  @override
  Color get secondary => const Color(0xFFFF4893);

  @override
  Color get secondaryLight => const Color(0xFFFF78B0);

  @override
  Color get background => const Color(0xFFF2F8F7);

  @override
  Color get surface => const Color(0xFFF6FEFD);

  @override
  Color get surfaceVariant => const Color(0xFFFFFFFF);

  @override
  Color get textPrimary => const Color(0xFF424B59);

  @override
  Color get textSecondary => const Color(0xFF6E7C91);

  @override
  Color get textTertiary => const Color(0xFFB5BCC4);

  @override
  Color get border => const Color(0xFFCED7E3);

  @override
  Color get success => const Color(0xFF0D9488);

  @override
  Color get warning => const Color(0xFFF9C323);

  @override
  Color get error => const Color(0xFFFF6B6B);

  @override
  Color get info => const Color(0xFF74B9FF);

  @override
  LinearGradient get headerGradient => const LinearGradient(
        begin: Alignment(-0.15, -1.0),
        end: Alignment(1.0, 1.0),
        colors: [Color(0xFF0D9488), Color(0xFFFAC642)],
      );
}

/// Predefined color palettes
class DSColorPalettes {
  DSColorPalettes._();

  static ColorSource get defaultPalette => DefaultColors();
  static ColorSource get tealPink => TealPinkColors();
  static ColorSource get blue => BlueColors();
  static ColorSource get purple => PurpleColors();
  static ColorSource get green => GreenColors();
}

class BlueColors extends ColorSource {
  @override
  Color get primary => const Color(0xFF2196F3);

  @override
  Color get secondary => const Color(0xFFFF9800);
}

class PurpleColors extends ColorSource {
  @override
  Color get primary => const Color(0xFF9C27B0);

  @override
  Color get secondary => const Color(0xFF00BCD4);
}

class GreenColors extends ColorSource {
  @override
  Color get primary => const Color(0xFF4CAF50);

  @override
  Color get secondary => const Color(0xFFFF9800);
}

/// Extension on BuildContext for convenient color access
extension DSColorsContext on BuildContext {
  Color get primaryColor => DSColors.primary;
  Color get secondaryColor => DSColors.secondary;
  Color get backgroundColor => DSColors.background;
  Color get surfaceColor => DSColors.surface;
  Color get textColor => DSColors.textPrimary;
  Color get borderColor => DSColors.border;
}

/// ============================================================================
/// USAGE EXAMPLES
/// ============================================================================

/// Example 1: Zero-config (use defaults)
/// ```dart
/// void main() {
///   runApp(MyApp());
/// }
/// 
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       home: Scaffold(
///         body: Container(
///           color: DSColors.primary, // Works out-of-the-box!
///         ),
///       ),
///     );
///   }
/// }
/// ```

/// Example 2: Override with predefined palette
/// ```dart
/// void main() {
///   DSColors.setSource(DSColorPalettes.tealPink);
///   runApp(MyApp());
/// }
/// ```

/// Example 3: Custom AppColors (override only what you need)
/// ```dart
/// class AppColors extends ColorSource {
///   @override
///   Color get primary => const Color(0xFF0D9488);
///   
///   @override
///   Color get secondary => const Color(0xFFFF4893);
///   
///   // All other colors inherit from ColorSource defaults
/// }
/// 
/// void main() {
///   DSColors.setSource(AppColors());
///   runApp(MyApp());
/// }
/// ```

/// Example 4: Override all colors
/// ```dart
/// class AppColors extends ColorSource {
///   @override Color get primary => const Color(0xFF0D9488);
///   @override Color get primaryLight => const Color(0xFF4FBFB4);
///   @override Color get primaryDark => const Color(0xFF0A7A72);
///   @override Color get secondary => const Color(0xFFFF4893);
///   @override Color get background => const Color(0xFFF2F8F7);
///   @override Color get surface => const Color(0xFFF6FEFD);
///   @override Color get textPrimary => const Color(0xFF424B59);
///   @override Color get success => const Color(0xFF0D9488);
///   @override Color get warning => const Color(0xFFF9C323);
///   @override Color get error => const Color(0xFFFF6B6B);
///   // ... override all colors
/// }
/// ```

/// Example 5: Multi-tenant support (dynamic switching)
/// ```dart
/// class TenantColorManager {
///   static ColorSource getColorsForTenant(String tenantId) {
///     switch (tenantId) {
///       case 'tenant_a':
///         return TenantAColors();
///       case 'tenant_b':
///         return TenantBColors();
///       default:
///         return DefaultColors();
///     }
///   }
/// }
/// 
/// void onTenantLogin(String tenantId) {
///   DSColors.setSource(TenantColorManager.getColorsForTenant(tenantId));
///   // Trigger rebuild to reflect changes
/// }
/// ```

/// Example 6: Scheduled theme updates
/// ```dart
/// class ScheduledThemeManager {
///   static void applyScheduledTheme() {
///     final hour = DateTime.now().hour;
///     
///     if (hour >= 6 && hour < 12) {
///       DSColors.setSource(MorningColors());
///     } else if (hour >= 12 && hour < 18) {
///       DSColors.setSource(AfternoonColors());
///     } else {
///       DSColors.setSource(EveningColors());
///     }
///   }
/// }
/// 
/// void main() {
///   ScheduledThemeManager.applyScheduledTheme();
///   
///   // Update every hour
///   Timer.periodic(Duration(hours: 1), (_) {
///     ScheduledThemeManager.applyScheduledTheme();
///   });
///   
///   runApp(MyApp());
/// }
/// ```

/// Example 7: Backend-driven colors
/// ```dart
/// class BackendColorSource extends ColorSource {
///   final Map<String, dynamic> _colorsFromBackend;
///   
///   BackendColorSource(this._colorsFromBackend);
///   
///   @override
///   Color get primary => _parseColor(_colorsFromBackend['primary']);
///   
///   @override
///   Color get secondary => _parseColor(_colorsFromBackend['secondary']);
///   
///   Color _parseColor(dynamic value) {
///     if (value is String) {
///       return Color(int.parse(value.replaceAll('#', ''), radix: 16));
///     }
///     return super.primary; // Fallback
///   }
/// }
/// 
/// Future<void> loadBackendColors() async {
///   final response = await api.fetchColors();
///   DSColors.setSource(BackendColorSource(response.data));
/// }
/// ```