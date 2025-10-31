# Flutter Minimal Design 🎨

A minimal, production-ready design system for Flutter applications. Build beautiful, consistent UIs with pre-defined spacing, typography, colors, and components - following industry best practices.

[![pub package](https://img.shields.io/pub/v/flutter_minimal_design.svg)](https://pub.dev/packages/flutter_minimal_design)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- 🎯 **Consistent Design Tokens** - Spacing, sizing, colors, typography
- 📱 **Fully Responsive** - Built with flutter_screenutil for perfect scaling
- 🧩 **Pre-built Components** - AppBar, Buttons, Form Fields, Screen Wrapper
- 🎨 **Easy Customization** - Full copyWith support on all components
- ♿ **Accessible** - Follows WCAG guidelines (44×44 touch targets)
- 🌍 **RTL Support** - Works seamlessly with Arabic and other RTL languages
- 📦 **Zero Configuration** - Works out of the box
- 🔧 **Type-Safe** - Leverages Dart's type system

## 🎬 Preview

```dart
CustomScreen(
  title: 'Home',
  body: Column(
    children: [
      Text('Welcome Back!', style: DSTextStyles.pageTitle),
      DSVSpace.xlg,
      DSButton.primary(label: 'Get Started', onPressed: () {}),
    ],
  ),
)
```

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_minimal_design: ^1.0.0
  flutter_screenutil: ^5.9.0
  flutter_svg: ^2.0.9
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### 1. Initialize ScreenUtil

In your `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_minimal_design/flutter_minimal_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone 11 Pro
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'My App',
          home: HomeScreen(),
        );
      },
    );
  }
}
```

### 2. Use CustomScreen Wrapper

```dart
import 'package:flutter_minimal_design/flutter_minimal_design.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Home',
      body: Column(
        children: [
          Text('Welcome!', style: DSTextStyles.pageTitle),
          DSVSpace.xlg,
          DSButton.primary(
            label: 'Get Started',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
```

## 📚 Core Components

### 🖼️ CustomScreen - Universal Screen Wrapper

The heart of the design system - provides consistent layout for all screens:

```dart
// Basic screen
CustomScreen(
  title: 'Home',
  body: YourContent(),
)

// Form screen (keyboard aware)
DSScreen.form(
  title: 'Login',
  body: LoginForm(),
)

// Loading state
CustomScreen(
  title: 'Data',
  isLoading: true,
  body: Content(),
)

// Error state with retry
CustomScreen(
  title: 'Data',
  hasError: true,
  onRetry: () => _loadData(),
  body: Content(),
)

// Custom padding
CustomScreen(
  title: 'Custom',
  body: Content(),
  padding: EdgeInsets.all(16.w),
)
```

**Features:**
- ✅ Automatic AppBar integration
- ✅ Built-in loading & error states
- ✅ Safe area handling
- ✅ Responsive padding (20×20 default)
- ✅ Auto-scroll with bounce physics
- ✅ Keyboard awareness
- ✅ Complete copyWith support

### 🔼 AppBar Component

```dart
CustomScreen(
  title: 'Settings',
  hideBackButton: false,
  appBarEndWidget: IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () {},
  ),
  body: Content(),
)
```

### 🔘 Buttons

```dart
// Primary button
DSButton.primary(
  label: 'Continue',
  onPressed: () {},
)

// Secondary button
DSButton.secondary(
  label: 'Cancel',
  onPressed: () {},
)

// Danger button
DSButton.danger(
  label: 'Delete',
  onPressed: () {},
)

// Success button
DSButton.success(
  label: 'Confirm',
  onPressed: () {},
)

// Text button
DSButton.text(
  label: 'Skip',
  onPressed: () {},
)

// Custom button
CustomButton(
  label: 'Custom',
  onPressed: () {},
  backgroundColor: Colors.purple,
  isIconButton: true,
  iconPath: 'assets/icons/icon.svg',
)
```

### 📝 Form Fields

```dart
// Email field
DSFormField.email(
  controller: emailController,
)

// Password field
DSFormField.password(
  controller: passwordController,
)

// Phone field with country code
DSFormField.phone(
  countryCode: '966',
  showCountryCode: true,
)

// Search field
DSFormField.search(
  onChanged: (value) => _search(value),
)

// Text area
DSFormField.textArea(
  labelText: 'Description',
  maxLength: 500,
)

// Custom field
CustomAppTextFormField(
  labelText: 'Name',
  hintText: 'Enter your name',
  validator: (value) => value!.isEmpty ? 'Required' : null,
)
```

## 🎨 Design Tokens

### Spacing

```dart
DSSpacing.xsm   // 4  - Extra small
DSSpacing.sm    // 8  - Small
DSSpacing.md    // 12 - Medium (default)
DSSpacing.lg    // 16 - Large
DSSpacing.xlg   // 20 - Extra large
DSSpacing.xxlg  // 24 - Double XL
DSSpacing.xxxlg // 32 - Triple XL

// Usage
DSVSpace.xlg    // 20.h vertical gap
DSHSpace.md     // 12.w horizontal gap
```

### Sizes

```dart
// Buttons
DSSize.buttonHeight         // 48.h
DSSize.smallButtonHeight    // 32.h
DSSize.minTouchTarget       // 44.h (accessibility)

// Icons
DSSize.iconXs   // 16.sp
DSSize.iconSm   // 20.sp
DSSize.iconMd   // 24.sp
DSSize.iconLg   // 32.sp
DSSize.iconXl   // 40.sp

// Avatars
DSSize.avatarSm   // 32.w
DSSize.avatarMd   // 48.w
DSSize.avatarLg   // 64.w
DSSize.avatarXl   // 80.w

// Border Radius
DSSize.radiusSm   // 8.r
DSSize.radiusMd   // 12.r
DSSize.radiusLg   // 16.r
DSSize.radiusXl   // 20.r
DSSize.radiusPill // 24.r
```

### Typography

```dart
DSTextStyles.pageTitle        // 20.sp, w700
DSTextStyles.sectionHeader    // 16.sp, w700
DSTextStyles.subheader        // 14.sp, w600
DSTextStyles.body             // 14.sp, w400
DSTextStyles.label            // 12.sp, w500
DSTextStyles.caption          // 12.sp, w400
DSTextStyles.button           // 16.sp, w600
```

### Padding Presets

```dart
DSEdgeInsets.screen      // 20×20 (full screen)
DSEdgeInsets.container   // 12×8
DSEdgeInsets.button      // 16×12
DSEdgeInsets.card        // 16×12
DSEdgeInsets.formField   // 16×14
DSEdgeInsets.listItem    // 12×12
```

## 📱 Complete Examples

### Login Screen

```dart
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Login',
      hideBackButton: true,
      isLoading: _isLoading,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back', style: DSTextStyles.pageTitle),
            DSVSpace.xlg,
            
            DSFormField.email(
              controller: _emailController,
            ),
            DSVSpace.lg,
            
            DSFormField.password(
              controller: _passwordController,
            ),
            DSVSpace.xxxlg,
            
            DSButton.primary(
              label: 'Login',
              onPressed: _handleLogin,
            ),
            DSVSpace.md,
            
            DSButton.text(
              label: 'Forgot Password?',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // Login logic
      await Future.delayed(Duration(seconds: 2));
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

### List Screen

```dart
class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _isLoading = true;
  bool _hasError = false;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Products',
      isLoading: _isLoading,
      hasError: _hasError,
      onRetry: _loadProducts,
      appBarEndWidget: IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: _showFilters,
      ),
      body: Column(
        children: [
          DSFormField.search(
            onChanged: (value) => _searchProducts(value),
          ),
          DSVSpace.lg,
          
          ..._products.map((product) => Column(
            children: [
              ProductCard(product: product),
              DSVSpace.md,
            ],
          )),
        ],
      ),
    );
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final products = await ProductService.fetchProducts();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }
}
```

### Settings Screen

```dart
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Settings',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: DSTextStyles.sectionHeader),
          DSVSpace.md,
          
          SettingTile(
            icon: Icons.person,
            title: 'Edit Profile',
            onTap: () {},
          ),
          DSVSpace.sm,
          
          SettingTile(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {},
          ),
          DSVSpace.xlg,
          
          Text('Preferences', style: DSTextStyles.sectionHeader),
          DSVSpace.md,
          
          SettingTile(
            icon: Icons.notifications,
            title: 'Notifications',
            trailing: Switch(value: true, onChanged: (v) {}),
          ),
          DSVSpace.xlg,
          
          DSButton.danger(
            label: 'Logout',
            onPressed: () => _handleLogout(),
          ),
        ],
      ),
    );
  }
}
```

## 🎨 Pre-configured Screen Variants

```dart
// Basic screen
DSScreen.basic(
  title: 'Home',
  body: Content(),
)

// Form screen (keyboard aware, no scroll)
DSScreen.form(
  title: 'Register',
  body: RegistrationForm(),
)

// Details screen (scrollable)
DSScreen.details(
  title: 'Article',
  body: ArticleContent(),
)

// No AppBar
DSScreen.noAppBar(
  body: OnboardingContent(),
)

// Full screen (no padding/safe area)
DSScreen.fullScreen(
  body: SplashScreen(),
)

// Loading screen
DSScreen.loading(
  title: 'Loading',
)

// Error screen
DSScreen.error(
  title: 'Error',
  onRetry: () => _reload(),
)

// With bottom navigation
DSScreen.withBottomNav(
  title: 'Home',
  body: Content(),
  bottomNavigationBar: BottomNav(),
)

// With FAB
DSScreen.withFAB(
  title: 'Messages',
  body: MessagesList(),
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () {},
  ),
)
```

## 🎯 Best Practices

### 1. Always Use Design Tokens

```dart
// ❌ Bad
padding: EdgeInsets.all(12.w)

// ✅ Good
padding: DSEdgeInsets.container
```

### 2. Use Pre-configured Variants

```dart
// ❌ Verbose
CustomButton(
  label: 'Submit',
  backgroundColor: Color(0xFF1A4220),
  textColor: Colors.white,
  // ... many parameters
)

// ✅ Simple
DSButton.primary(
  label: 'Submit',
  onPressed: () {},
)
```

### 3. Consistent Spacing

```dart
// ✅ Good
Column(
  children: [
    Text('Title'),
    DSVSpace.xlg,     // 20.h between sections
    Text('Content'),
    DSVSpace.md,      // 12.h between items
    DSButton.primary(...),
  ],
)
```

### 4. Use CustomScreen for All Screens

```dart
// ✅ Consistent layout
CustomScreen(
  title: 'My Screen',
  body: Content(),
)

// Automatically provides:
// - AppBar integration
// - Safe area handling
// - Responsive padding (20×20)
// - Loading/error states
// - Keyboard awareness
```

### 5. Respect Touch Targets (44×44 minimum)

```dart
// ❌ Bad - Too small
Container(
  width: 30.w,
  height: 30.h,
  child: IconButton(...),
)

// ✅ Good - Accessible
Container(
  width: DSSize.minTouchTarget,   // 44×44
  height: DSSize.minTouchTarget,
  child: IconButton(...),
)
```

## 📊 Design System Values

| Token | Value | Usage |
|-------|-------|-------|
| `DSEdgeInsets.screen` | 20×20 | Screen padding |
| `DSVSpace.xlg` | 20.h | Section gaps |
| `DSVSpace.md` | 12.h | Item gaps |
| `DSSize.buttonHeight` | 48.h | Button height |
| `DSSize.iconMd` | 24.sp | Standard icons |
| `DSRadius.md` | 12.r | Border radius |
| `DSTextStyles.pageTitle` | 20sp w700 | Page headers |
| `DSTextStyles.body` | 14sp w400 | Body text |

## 🎨 Customization

### Using copyWith

```dart
// Create base screen
final baseScreen = CustomScreen(
  title: 'Base',
  body: Content(),
);

// Create variants
final darkScreen = baseScreen.copyWith(
  appBarBackgroundColor: Colors.black87,
  appBarTitleColor: Colors.white,
  backgroundColor: Colors.grey.shade900,
);

final customButton = CustomButton(
  label: 'Base',
  onPressed: () {},
).copyWith(
  backgroundColor: Colors.purple,
  borderRadius: 20,
);
```

### Extend Design System

```dart
// Add your own spacing
class MySpacing {
  static double get custom => 40.h;
}

// Add your own text styles
class MyTextStyles {
  static TextStyle get custom => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
}
```

## 🔧 Configuration

### Change Design Size

```dart
ScreenUtilInit(
  designSize: const Size(390, 844), // iPhone 14 Pro
  builder: (context, child) => MaterialApp(...),
)
```

### Customize Default Colors

```dart
// In your app's theme
ThemeData(
  primaryColor: Color(0xFF1A4220),
  // Components will use this color
)
```

## 🐛 Troubleshooting

### Issue: Sizes not responsive

**Solution:** Make sure you initialized ScreenUtil:

```dart
ScreenUtilInit(
  designSize: const Size(375, 812),
  builder: (context, child) => MaterialApp(...),
)
```

### Issue: SVG icons not showing

**Solution:** Ensure flutter_svg is added and assets are in your app:

```yaml
# In your app's pubspec.yaml
dependencies:
  flutter_svg: ^2.0.9

flutter:
  assets:
    - assets/icons/
```

### Issue: CustomScreen not found

**Solution:** Import the package:

```dart
import 'package:flutter_minimal_design/flutter_minimal_design.dart';
```

## 📦 What's Included

- ✅ **Foundation**: Spacing, Sizing, Colors, Typography, Border Radius
- ✅ **Components**: CustomScreen, AppBar, Buttons, Form Fields
- ✅ **Utilities**: Spacing widgets, Padding presets, Extensions
- ✅ **Pre-configured Variants**: 6 button types, 6 form field types, 9 screen types
- ✅ **Complete copyWith**: All components support full customization

## 🎯 Package Size

Lightweight and minimal:
- Core package: ~50KB
- With dependencies: ~2MB (flutter_screenutil + flutter_svg)

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

## 👥 Authors

- Your Name - [GitHub](https://github.com/AmrIbrahim22)

## 🙏 Acknowledgments

- Built with Flutter and flutter_screenutil
- Follows Material Design and WCAG accessibility guidelines
- Inspired by modern design systems (Tailwind, Chakra UI, Material Design)

## 🔗 Links

- [Documentation](https://github.com/yourusername/flutter_minimal_design/wiki)
- [Examples](https://github.com/yourusername/flutter_minimal_design/tree/main/example)
- [Issue Tracker](https://github.com/yourusername/flutter_minimal_design/issues)
- [pub.dev](https://pub.dev/packages/flutter_minimal_design)

---

