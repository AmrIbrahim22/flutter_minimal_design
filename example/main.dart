import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_minimal_design/flutter_minimal_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Minimal Design Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xFF1A4220),
            useMaterial3: true,
          ),
          home: DemoHomeScreen(),
        );
      },
    );
  }
}

class DemoHomeScreen extends StatelessWidget {
  const DemoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Flutter Minimal Design',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Text(
              'Welcome to Flutter Minimal Design',
              style: DSTextStyles.pageTitle,
            ),
            DSVSpace.md,
            Text(
              'A minimal design system for Flutter',
              style: DSTextStyles.body.copyWith(color: Colors.grey),
            ),
            DSVSpace.xlg,
            
            // Typography Demo
            _DemoSection(
              title: 'Typography',
              children: [
                Text('Page Title', style: DSTextStyles.pageTitle),
                DSVSpace.sm,
                Text('Section Header', style: DSTextStyles.sectionHeader),
                DSVSpace.sm,
                Text('Subheader', style: DSTextStyles.subheader),
                DSVSpace.sm,
                Text('Body Text', style: DSTextStyles.body),
                DSVSpace.sm,
                Text('Label', style: DSTextStyles.label),
                DSVSpace.sm,
                Text('Caption', style: DSTextStyles.caption),
              ],
            ),
            DSVSpace.xlg,
            
            // Buttons Demo
            _DemoSection(
              title: 'Buttons',
              children: [
                DSButton.primary(label: 'Primary', onPressed: () {}),
                DSVSpace.md,
                DSButton.secondary(label: 'Secondary', onPressed: () {}),
                DSVSpace.md,
                DSButton.danger(label: 'Danger', onPressed: () {}),
                DSVSpace.md,
                DSButton.success(label: 'Success', onPressed: () {}),
                DSVSpace.md,
                DSButton.warning(label: 'Warning', onPressed: () {}),
                DSVSpace.md,
                DSButton.text(label: 'Text Button', onPressed: () {}),
              ],
            ),
            DSVSpace.xlg,
            
            // Form Fields Demo
            _DemoSection(
              title: 'Form Fields',
              children: [
                CustomFormField(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
                DSVSpace.lg,
                DSFormField.email(),
                DSVSpace.lg,
                DSFormField.password(),
                DSVSpace.lg,
                DSFormField.phone(),
              ],
            ),
            DSVSpace.xlg,
            
            // Spacing Demo
            _DemoSection(
              title: 'Spacing',
              children: [
                _SpacingExample('xsm', DSSpacing.xsm.vertical),
                _SpacingExample('sm', DSSpacing.sm.vertical),
                _SpacingExample('md', DSSpacing.md.vertical),
                _SpacingExample('lg', DSSpacing.lg.vertical),
                _SpacingExample('xlg', DSSpacing.xlg.vertical),
                _SpacingExample('xxlg', DSSpacing.xxlg.vertical),
              ],
            ),
            DSVSpace.xlg,
            
            // Navigation Buttons
            DSButton.primary(
              label: 'View More Examples',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MoreExamplesScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DemoSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DSEdgeInsets.card,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: DSRadius.lg,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: DSTextStyles.sectionHeader),
          DSVSpace.md,
          ...children,
        ],
      ),
    );
  }
}

class _SpacingExample extends StatelessWidget {
  final String name;
  final double height;

  const _SpacingExample(this.name, this.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60.w,
          child: Text(name, style: DSTextStyles.label),
        ),
        Container(
          width: 100.w,
          height: height,
          color: Colors.blue.withOpacity(0.3),
        ),
        DSHSpace.md,
        Text('${height.toStringAsFixed(1)}h', style: DSTextStyles.caption),
      ],
    );
  }
}

// More Examples Screen
class MoreExamplesScreen extends StatelessWidget {
  const MoreExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'More Examples',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Screen Variants', style: DSTextStyles.sectionHeader),
          DSVSpace.md,
          
          _ExampleButton(
            label: 'Login Form',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginExampleScreen()),
            ),
          ),
          DSVSpace.sm,
          
          _ExampleButton(
            label: 'List Screen',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ListExampleScreen()),
            ),
          ),
          DSVSpace.sm,
          
          _ExampleButton(
            label: 'Settings Screen',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SettingsExampleScreen()),
            ),
          ),
          DSVSpace.sm,
          
          _ExampleButton(
            label: 'Loading State',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoadingExampleScreen()),
            ),
          ),
          DSVSpace.sm,
          
          _ExampleButton(
            label: 'Error State',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ErrorExampleScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExampleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _ExampleButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: DSEdgeInsets.listItem,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: DSRadius.md,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: DSTextStyles.subheader),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// Example screens
class LoginExampleScreen extends StatelessWidget {
  const LoginExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DSScreen.form(
      title: 'Login',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome Back', style: DSTextStyles.pageTitle),
          DSVSpace.xlg,
          DSFormField.email(),
          DSVSpace.lg,
          DSFormField.password(),
          DSVSpace.xxxlg,
          DSButton.primary(label: 'Login', onPressed: () {}),
        ],
      ),
    );
  }
}

class ListExampleScreen extends StatelessWidget {
  const ListExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Products',
      body: Column(
        children: [
          DSFormField.search(onChanged: (v) {}),
          DSVSpace.lg,
          ...List.generate(
            5,
            (i) => Column(
              children: [
                Container(
                  padding: DSEdgeInsets.card,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: DSRadius.md,
                  ),
                  child: Text('Product ${i + 1}'),
                ),
                DSVSpace.md,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsExampleScreen extends StatelessWidget {
  const SettingsExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Settings',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: DSTextStyles.sectionHeader),
          DSVSpace.md,
          ...List.generate(3, (i) => _SettingTile('Setting ${i + 1}')),
          DSVSpace.xlg,
          DSButton.danger(label: 'Logout', onPressed: () {}),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String title;
  const _SettingTile(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: DSEdgeInsets.listItem,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: DSRadius.md,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Icon(Icons.chevron_right, size: DSSize.iconMd),
            ],
          ),
        ),
        DSVSpace.sm,
      ],
    );
  }
}

class LoadingExampleScreen extends StatelessWidget {
  const LoadingExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DSScreen.loading(title: 'Loading');
  }
}

class ErrorExampleScreen extends StatelessWidget {
  const ErrorExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DSScreen.error(
      title: 'Error',
      onRetry: () => Navigator.pop(context),
    );
  }
}




