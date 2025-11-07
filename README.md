# Flutter Minimal Design

A production-ready Flutter design system that ships the hard parts of spacing, typography, color, and standard components so you can focus on product work instead of recreating UI foundations.

[![pub package](https://img.shields.io/pub/v/flutter_minimal_design.svg)](https://pub.dev/packages/flutter_minimal_design)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## Why This Exists
- Opinionated design tokens that already follow accessibility constraints (44 px touch targets, readable contrast).
- ScreenUtil-driven scaling that keeps your spacing and typography consistent across devices.
- Drop-in components (screen wrapper, buttons, form fields, rich text) that expose copyWith APIs instead of forcing forks.
- Zero-config color system with optional palette overrides.
- Battle-tested defaults for loading/error states, navigation patterns, and responsive padding.

---

## Table of Contents
1. [Installation](#installation)
2. [Quick Start](#quick-start)
3. [Design Tokens](#design-tokens)
   - [Spacing Scale](#spacing-scale)
   - [Spacing Helpers](#spacing-helpers)
   - [Size & Radius Tokens](#size--radius-tokens)
   - [Typography](#typography)
   - [Color System](#color-system)
4. [Core Components](#core-components)
   - [CustomScreen](#customscreen)
   - [AppAppBar](#appappbar)
   - [Text System](#text-system)
   - [Buttons](#buttons)
   - [Form Fields](#form-fields)
   - [Rich Text](#rich-text)
5. [Utilities & Extensions](#utilities--extensions)
6. [Putting It Together](#putting-it-together)
7. [Customization Playbook](#customization-playbook)
8. [FAQ & Troubleshooting](#faq--troubleshooting)
9. [Contributing](#contributing)
10. [License](#license)

---

## Installation
Add the package and its peer dependencies to `pubspec.yaml`:

```yaml
dependencies:
  flutter_minimal_design: ^1.0.6
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.2.1
```

Then fetch packages:

```bash
flutter pub get
```

---

## Quick Start

### 1. Wrap your app with `ScreenUtilInit`
The design system assumes a `375 × 812` design canvas (iPhone 11/12). ScreenUtil handles scaling.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_minimal_design/flutter_minimal_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        title: 'Minimal Design Demo',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
```

### 2. Use the screen wrapper everywhere

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DSTextStyles.initialize(context); // once per app (optional)

    return CustomScreen(
      title: 'Dashboard',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppText('Welcome back', style: DSTextStyles.pageTitle),
          DSVSpace.xlg,
          DSButton.primary(label: 'Get Started', onPressed: () {}),
        ],
      ),
    );
  }
}
```

---

## Design Tokens

### Spacing Scale
`DSSpacing` exposes actual base pixel values. ScreenUtil converts them to responsive logical pixels using `.h` (height) and `.w` (width).

| Token | Base px | `vertical` (height) | `horizontal` (width) | Typical usage |
| --- | --- | --- | --- | --- |
| `xsm` | 4 | `DSSpacing.xsm.vertical` | `DSSpacing.xsm.horizontal` | Icon nudges, tight clusters |
| `sm` | 8 | `DSSpacing.sm.vertical` | `DSSpacing.sm.horizontal` | Dense lists, chips |
| `md` | 12 | `DSSpacing.md.vertical` | `DSSpacing.md.horizontal` | Default element gaps |
| `lg` | 16 | `DSSpacing.lg.vertical` | `DSSpacing.lg.horizontal` | Section spacing, card padding |
| `xlg` | 20 | `DSSpacing.xlg.vertical` | `DSSpacing.xlg.horizontal` | Screen gutters, hero spacing |
| `xxlg` | 24 | `DSSpacing.xxlg.vertical` | `DSSpacing.xxlg.horizontal` | Large section breaks |
| `xxxlg` | 32 | `DSSpacing.xxxlg.vertical` | `DSSpacing.xxxlg.horizontal` | Page transitions, hero layouts |

> Use vertical helpers (`DSVSpace.*`) between Column children and horizontal helpers (`DSHSpace.*`) inside Rows.

### Spacing Helpers

| Helper | Value (base px) | Notes |
| --- | --- | --- |
| `DSEdgeInsets.screen` | 16 × 16 | Default `CustomScreen` padding |
| `DSEdgeInsets.bottomSheet` | 16 × 16 | Standard modal sheet padding |
| `DSEdgeInsets.container` | 12 × 8 | Balanced card/list padding |
| `DSEdgeInsets.listItem` | 12 all sides | Dense tap targets with comfortable spacing |
| `DSEdgeInsets.button` | 16 × 12 | Matches `DSSize.buttonHeight` |
| `DSEdgeInsets.formField` | 16 × 14 | WCAG-compliant control padding |

### Size & Radius Tokens

| Token | Base px | Description |
| --- | --- | --- |
| `DSSize.buttonHeight` | 48 | Primary buttons and form submission height |
| `DSSize.smallButtonHeight` | 32 | Secondary/tertiary button height |
| `DSSize.iconButtonSize` | 44 | Minimum tap target for icon buttons |
| `DSSize.minTouchTarget` | 44 | WCAG minimum touch size (used across widgets) |
| `DSSize.iconXs` | 16 | Icon size xs |
| `DSSize.iconSm` | 20 | Standard icon in dense UIs |
| `DSSize.iconMd` | 24 | Default icon size |
| `DSSize.iconLg` | 32 | Large icon |
| `DSSize.iconXl` | 40 | Hero icon |
| `DSSize.avatarSm/Md/Lg/Xl` | 32 / 48 / 64 / 80 | Avatar dimensions (square) |

| Radius Helper | Base px | Typical scenarios |
| --- | --- | --- |
| `DSRadius.sm` | 8 | List tiles, input fields |
| `DSRadius.md` | 12 | Cards, buttons |
| `DSRadius.lg` | 16 | Sheets, modals |
| `DSRadius.xl` | 20 | Elevated cards |
| `DSRadius.pill` | 24 | Pill buttons, tags |
| `DSRadius.full` | 999 | Circular badges |

### Typography
The text system adapts to your theme font. Call `DSTextStyles.initialize(context)` once after `MaterialApp` builds to read `ThemeData.textTheme`.

| Style | Size (sp @ 375) | Weight | Line height | Usage |
| --- | --- | --- | --- | --- |
| `pageTitle` | 20 | w700 | 1.2 | Screen titles, headlines |
| `sectionHeader` | 16 | w700 | 1.2 | Section titles |
| `subheader` | 14 | w600 | 1.3 | Secondary headings |
| `body` | 14 | w400 | 1.5 | Default paragraphs |
| `label` | 12 | w500 | 1.4 | Upper labels, metadata |
| `caption` | 12 | w400 | 1.4 | Helper text |
| `button` | 16 | w600 | 1.2 | Buttons and CTAs |
| `bottomSheetTitle` | 18 | w600 | 1.2 | Modal titles |
| `bottomSheetDescription` | 14 | w400 | 1.6 | Modal body |
| `formField` | 14 | w400 | 1.4 | TextFormField style |
| `hint` | 14 | w400 | 1.4 | Placeholder text |
| `error` | 12 | w400 | 1.4 | Validation/error labels |

### Color System
`DSColors` ships with a neutral palette that works in light mode out of the box. Override by providing a `ColorSource`.

| Role | Hex |
| --- | --- |
| `primary` | `#6366F1`
| `primaryLight` | `#818CF8`
| `primaryDark` | `#4F46E5`
| `secondary` | `#EC4899`
| `secondaryLight` | `#F472B6`
| `background` | `#F9FAFB`
| `surface` | `#FFFFFF`
| `surfaceVariant` | `#F3F4F6`
| `textPrimary` | `#1F2937`
| `textSecondary` | `#6B7280`
| `textTertiary` | `#9CA3AF`
| `border` | `#D1D5DB`
| `success` | `#10B981`
| `warning` | `#F59E0B`
| `error` | `#EF4444`
| `info` | `#3B82F6`

Color utilities include gradients, glass effects, accessible contrasts, and string parsing (`'#0D9488'.toColor()`).

---

## Core Components

### `CustomScreen`
The universal scaffold. Handles safe areas, responsive padding, loading/error states, bottom sheets, and navigation. Key properties:

| Prop | Description |
| --- | --- |
| `title` | Text in the integrated `AppAppBar` |
| `showAppBar` | Toggle the app bar |
| `hideBackButton` / `onBackPressed` | Control navigation |
| `appBarLeadingWidget`, `appBarEndWidget` | Inject custom widgets |
| `padding` | Defaults to `DSEdgeInsets.screen` (16 × 16) |
| `enableScroll` | Wraps content in `SingleChildScrollView` when true |
| `isLoading`, `loadingWidget` | Full-page loading state |
| `hasError`, `errorWidget`, `onRetry` | Built-in retry pattern |
| `bottomSheet`, `bottomNavigationBar`, `floatingActionButton` | Standard scaffold slots |

```dart
CustomScreen(
  title: 'Profile',
  appBarLeadingWidget: const BackButton(),
  showLeadingBorder: false,
  isLoading: state.isLoading,
  hasError: state.hasError,
  onRetry: () => refetch(),
  body: Padding(
    padding: DSEdgeInsets.container,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAppText('Account', style: DSTextStyles.sectionHeader),
        DSVSpace.md,
        CustomAppText('Edit your information', style: DSTextStyles.body),
      ],
    ),
  ),
);
```

### `AppAppBar`
A lean app bar that respects the design tokens. Supports:
- Custom leading widgets with optional border (default width 1 px using `DSSpacing.lg`).
- Automatic back navigation via `NavigationUtils.defaultBackAction(context)`.
- Optional trailing widget and brand colors.

```dart
AppAppBar(
  title: 'Settings',
  leadingWidget: IconButton(
    icon: const Icon(Icons.close),
    onPressed: () => NavigationUtils.defaultBackAction(context),
  ),
  showLeadingBorder: false,
  endWidget: IconButton(
    icon: const Icon(Icons.more_vert),
    onPressed: () {},
  ),
);
```

### Text System
Use `CustomAppText` for quick text rendering. It defaults to `DSTextStyles.body` and forwards every `Text` parameter.

```dart
CustomAppText(
  'Invite friends',
  style: DSTextStyles.subheader,
  color: DSColors.textPrimary,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
);
```

`DSTextStyles.initialize(context)` is idempotent—call it once after the first frame if you need the `ThemeData` font family.

### Buttons
`DSButton` exposes pre-configured constructors: `primary`, `secondary`, `success`, `danger`, `text`, `ghost`.

```dart
DSButton.primary(
  label: 'Continue',
  onPressed: () {},
);

DSButton.text(
  label: 'Skip for now',
  onPressed: () {},
);
```

Reach for `CustomButton` when you need deep customization (icon buttons, gradients, custom shapes). Base spacing and radii are applied for you.

### Form Fields
`DSFormField` variants cover email, password, phone, search, number, and text area. All inputs respect `DSSize.formFieldHeight` (48 px) and the shared padding.

```dart
DSFormField.password(
  controller: passwordController,
  labelText: 'Password',
  helperText: 'At least 8 characters',
);
```

For bespoke layouts use `CustomAppTextFormField`; you still inherit the DS styles and validators.

### Rich Text
`DSRichText` + `DSTextSpan` gives you structured text with mix-and-match styles and clickable links.

```dart
DSRichText(
  spans: [
    DSTextSpan.body('By continuing, you agree to our '),
    DSTextSpan.link('Terms', onTap: openTerms),
    DSTextSpan.body(' and '),
    DSTextSpan.link('Privacy Policy', onTap: openPrivacy),
  ],
);
```

---

## Utilities & Extensions

- **Navigation**: `NavigationUtils.defaultBackAction(context)` pops when possible, otherwise delegates to `Navigator.of(context).maybePop()`.
- **Color extensions**: `DSColors.primary.glass()`, `.softShadow()`, `.linearGradientTo(DSColors.secondary)`, `.blend()`, `.hasGoodContrast(Colors.white)`.
- **Context shortcuts**: `context.primaryColor`, `context.secondaryColor`, `context.textColor`, etc.
- **Spacing widgets**: `DSVSpace.*`, `DSHSpace.*`, and `DSSizedBox` for icons/avatars.

---

## Putting It Together

```dart
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Checkout',
      appBarEndWidget: IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {},
      ),
      body: Padding(
        padding: DSEdgeInsets.container,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppText('Order summary', style: DSTextStyles.sectionHeader),
            DSVSpace.lg,
            Container(
              padding: DSEdgeInsets.card,
              decoration: BoxDecoration(
                color: DSColors.surface,
                borderRadius: DSRadius.lg,
                boxShadow: DSColors.primary.softShadow(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppText('Pro Plan', style: DSTextStyles.subheader),
                  DSVSpace.sm,
                  DSRichText(
                    spans: [
                      DSTextSpan.caption('Billed at '),
                      DSTextSpan.bold('\$69.00'),
                      DSTextSpan.caption('/year'),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            DSButton.primary(label: 'Pay now', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
```

---

## Customization Playbook

1. **Change the color palette**
   ```dart
   class AppColors extends ColorSource {
     @override
     Color get primary => const Color(0xFF0D9488);
     @override
     Color get secondary => const Color(0xFFFF4893);
     // override only what you need
   }

   void main() {
     DSColors.setSource(AppColors());
     runApp(const MyApp());
   }
   ```

2. **Adopt a custom font**
   ```dart
   MaterialApp(
     theme: ThemeData(fontFamily: 'Cairo'),
     home: Builder(
       builder: (context) {
         DSTextStyles.initialize(context);
         return const HomeScreen();
       },
     ),
   );
   ```

3. **Tune spacing per screen**
   ```dart
   CustomScreen(
     padding: DSEdgeInsets.screen.copyWith(top: DSSpacing.xxxlg.vertical),
     body: ...,
   );
   ```

4. **Override button styling globally**
   ```dart
   final button = DSButton.primary(
     label: 'Confirm',
     onPressed: () {},
   ).copyWith(
     backgroundColor: DSColors.secondary,
     textStyle: DSTextStyles.button.copyWith(color: DSColors.textOnPrimary),
   );
   ```

---

## FAQ & Troubleshooting

**Spacing looks wrong on tablets.**
Make sure every screen sits under `ScreenUtilInit`. Use `enableScroll: true` on `CustomScreen` to keep content responsive.

**Fonts didn't change after I set a new family.**
Call `DSTextStyles.initialize(context)` after the theme is loaded (e.g. inside the first screen using `WidgetsBinding.instance.addPostFrameCallback`). The call is safe to execute multiple times but will only initialize once.

**Back button pops the app instead of the current route.**
If you override `onBackPressed`, call `NavigationUtils.defaultBackAction(context)` inside your handler to keep the default logic.

**Do I need flutter_svg?**
We rely on `flutter_svg` for icon buttons and rich illustrations in the example components. If you don't use SVG assets you can omit it, but keep the dependency aligned with the versions above to avoid analyzer warnings.

---

## Contributing
Pull requests, issues, and feature proposals are welcome. Please see the issue tracker for current priorities. Run `flutter analyze` and include sample usage when you add new components.

## License
MIT License © Amr Ibrahim

See `CHANGELOG.md` for detailed release notes.
