# Changelog

All notable changes to this project will be documented in this file.

## [1.0.6] - 2025-11-07

### Changed
- Comprehensive README rewrite with spacing, sizing, and component reference tables
- Installation instructions synced with current dependency versions

### Fixed
- Aligned package metadata and documentation to reflect the 1.0.6 release

## [1.0.5] - 2025-11-01
### Fixed
- **CustomScreen** - Hot fix applied to custom Screen component

### Fixed
- **CustpmAppBar** - Hot fix applied to custom AppBar component
## [1.0.4] - 2025-11-01

### Fixed
- **CustpmAppBar** - Hot fix applied to custom AppBar component
## [1.0.3] - 2025-11-01

### Fixed
- **CustomFormField** - Hot fix applied to custom form field component

## [1.0.2] - 2025-11-01

### Added
- **DSRichText** - Rich text widget with DSTextSpan support for mixed styles, clickable links, and formatted text
- **DSTextSpan** - Text span builder with factory constructors for all text styles (pageTitle, sectionHeader, body, link, bold, italic, etc.)
- **DSColors** - Complete zero-config color system with ColorSource pattern for easy customization
- **ColorSource & ColorSource implementations** - Abstract interface for color providers with default implementations
- **DSColorPalettes** - Predefined color palettes (default, tealPink, blue, purple, green)
- **DSColorExtensions** - Comprehensive color manipulation utilities:
  - Color manipulation (lighten, darken, saturate, desaturate)
  - Glass effects (glass, frosted, glassLight, glassDark)
  - Shadow generators (softShadow, mediumShadow, hardShadow, coloredShadow, glowingShadow)
  - Gradient builders (linearGradientTo, shimmerGradient, glassGradient)
  - Accessibility helpers (onColor, isLight, isDark, contrastRatio, hasGoodContrast)
  - String to Color conversion (supports #RGB, #RRGGBB, rgb(), rgba())
  - Color blending utilities
- **DSColorsContext extension** - BuildContext extensions for convenient color access (primaryColor, secondaryColor, etc.)
- **NavigationUtils** - Smart navigation helpers with defaultBackAction that works with any navigation package
- **AppAppBar enhancements**:
  - Custom leading widget support
  - Leading border control (showLeadingBorder, leadingBorderWidth, borderColor)
- **CustomScreen enhancements**:
  - AppBar leading widget customization
  - Leading border customization support

### Changed
- **DSColors refactored** - Complete overhaul from simple static colors to zero-config ColorSource pattern
  - Works out-of-the-box with defaults
  - No initialization required
  - Easy customization via ColorSource extension
  - Backward compatible usage (DSColors.primary still works)
- **AppAppBar** - Enhanced with leading widget and border customization options
- **CustomScreen** - Added AppBar leading customization support

### Features
- Zero-config color system works immediately without setup
- ColorSource pattern allows easy customization
- Predefined color palettes for quick theme switching
- Comprehensive color manipulation and effects library
- Rich text support with clickable links and mixed formatting
- Smart navigation utilities
- Enhanced AppBar customization capabilities

## [1.0.1] - 2025-10-31

### Added
- **CustomAppText** - Text widget with automatic DSTextStyles integration
- **DSTextStyles.initialize()** - Theme-aware font initialization API
- Direct style overrides (color, fontSize, fontWeight, decoration)

### Features
- CustomAppText defaults to DSTextStyles.body
- Seamless font family detection from MaterialApp theme
- Simple API for overriding specific style properties
- Better documentation and usage examples

## [1.0.0] - 2025-10-31

### Added
- Initial release
- Design tokens (DSSpacing, DSSize, DSRadius, DSColors, DSTextStyles)
- Core widgets (AppAppBar, CustomButton, CustomAppTextFormField)
- **CustomScreen** - Universal screen wrapper with loading/error states
- Pre-configured component variants (DSButton.*, DSFormField.*, DSScreen.*)
- Complete copyWith support for all widgets
- Accessibility features (44×44 touch targets)
- RTL support
- Comprehensive example app
- Full documentation

### Features
- Spacing: 7 levels (xsm to xxxlg)
- Text Styles: 7 variants (pageTitle to caption)
- Buttons: 6 pre-configured types
- Form Fields: 6 pre-configured types
- Screens: 9 pre-configured layouts