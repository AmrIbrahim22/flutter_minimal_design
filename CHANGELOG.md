# Changelog

All notable changes to this project will be documented in this file.

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