import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../flutter_minimal_design.dart';

/// CustomScreen - Universal screen wrapper with design system integration
/// 
/// Provides consistent layout structure for all app screens with:
/// - Automatic AppBar integration
/// - Safe area handling
/// - Responsive padding
/// - Scroll behavior
/// - Loading states
/// - Floating action button support
/// - Bottom navigation support
/// - Keyboard handling
class CustomScreen extends StatelessWidget {
  // AppBar configuration
  final String? title;
  final bool showAppBar;
  final bool hideBackButton;
  final VoidCallback? onBackPressed;
  final Widget? appBarEndWidget;
  final Color? appBarBackgroundColor;
  final Color? appBarTitleColor;
  final Color? appBarIconColor;
  
  // Screen content
  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  
  // Layout configuration
  final EdgeInsetsGeometry? padding;
  final bool useSafeArea;
  final bool enableScroll;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  
  // Screen behavior
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  
  // Loading & error states
  final bool isLoading;
  final Widget? loadingWidget;
  final bool hasError;
  final Widget? errorWidget;
  final VoidCallback? onRetry;
  
  // Drawer
  final Widget? drawer;
  final Widget? endDrawer;

  const CustomScreen({
    super.key,
    required this.body,
    this.title,
    this.showAppBar = true,
    this.hideBackButton = false,
    this.onBackPressed,
    this.appBarEndWidget,
    this.appBarBackgroundColor,
    this.appBarTitleColor,
    this.appBarIconColor,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.padding,
    this.useSafeArea = true,
    this.enableScroll = true,
    this.scrollPhysics,
    this.scrollController,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.isLoading = false,
    this.loadingWidget,
    this.hasError = false,
    this.errorWidget,
    this.onRetry,
    this.drawer,
    this.endDrawer,
  });

  /// Complete copyWith method
  CustomScreen copyWith({
    Widget? body,
    String? title,
    bool? showAppBar,
    bool? hideBackButton,
    VoidCallback? onBackPressed,
    Widget? appBarEndWidget,
    Color? appBarBackgroundColor,
    Color? appBarTitleColor,
    Color? appBarIconColor,
    Widget? bottomSheet,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    EdgeInsetsGeometry? padding,
    bool? useSafeArea,
    bool? enableScroll,
    ScrollPhysics? scrollPhysics,
    ScrollController? scrollController,
    Color? backgroundColor,
    bool? resizeToAvoidBottomInset,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    bool? isLoading,
    Widget? loadingWidget,
    bool? hasError,
    Widget? errorWidget,
    VoidCallback? onRetry,
    Widget? drawer,
    Widget? endDrawer,
  }) {
    return CustomScreen(
      body: body ?? this.body,
      title: title ?? this.title,
      showAppBar: showAppBar ?? this.showAppBar,
      hideBackButton: hideBackButton ?? this.hideBackButton,
      onBackPressed: onBackPressed ?? this.onBackPressed,
      appBarEndWidget: appBarEndWidget ?? this.appBarEndWidget,
      appBarBackgroundColor: appBarBackgroundColor ?? this.appBarBackgroundColor,
      appBarTitleColor: appBarTitleColor ?? this.appBarTitleColor,
      appBarIconColor: appBarIconColor ?? this.appBarIconColor,
      bottomSheet: bottomSheet ?? this.bottomSheet,
      bottomNavigationBar: bottomNavigationBar ?? this.bottomNavigationBar,
      floatingActionButton: floatingActionButton ?? this.floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ?? this.floatingActionButtonLocation,
      padding: padding ?? this.padding,
      useSafeArea: useSafeArea ?? this.useSafeArea,
      enableScroll: enableScroll ?? this.enableScroll,
      scrollPhysics: scrollPhysics ?? this.scrollPhysics,
      scrollController: scrollController ?? this.scrollController,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
      extendBody: extendBody ?? this.extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? this.extendBodyBehindAppBar,
      isLoading: isLoading ?? this.isLoading,
      loadingWidget: loadingWidget ?? this.loadingWidget,
      hasError: hasError ?? this.hasError,
      errorWidget: errorWidget ?? this.errorWidget,
      onRetry: onRetry ?? this.onRetry,
      drawer: drawer ?? this.drawer,
      endDrawer: endDrawer ?? this.endDrawer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppAppBar(
              title: title,
              hideIcon: hideBackButton,
              onBackPressed: onBackPressed,
              endWidget: appBarEndWidget,
              backgroundColor: appBarBackgroundColor,
              titleColor: appBarTitleColor,
              iconColor: appBarIconColor,
            )
          : null,
      body: _buildBody(context),
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawer: drawer,
      endDrawer: endDrawer,
    );
  }

  Widget _buildBody(BuildContext context) {
    Widget content;

    // Show loading state
    if (isLoading) {
      content = loadingWidget ?? _defaultLoadingWidget();
    }
    // Show error state
    else if (hasError) {
      content = errorWidget ?? _defaultErrorWidget();
    }
    // Show main content
    else {
      content = _buildContent();
    }

    // Wrap in safe area if needed
    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return content;
  }

  Widget _buildContent() {
    // Apply padding
    Widget content = Padding(
      padding: padding ?? DSEdgeInsets.screen, // Default: 20.w × 20.h
      child: body,
    );

    // Wrap in scroll view if enabled
    if (enableScroll) {
      content = SingleChildScrollView(
        physics: scrollPhysics ?? const BouncingScrollPhysics(),
        controller: scrollController,
        child: content,
      );
    }

    return content;
  }

  Widget _defaultLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1A4220)),
          ),
          DSVSpace.lg,
          Text(
            'Loading...',
            style: DSTextStyles.body.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _defaultErrorWidget() {
    return Center(
      child: Padding(
        padding: DSEdgeInsets.screen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: Colors.red.shade300,
            ),
            DSVSpace.lg,
            Text(
              'Something went wrong',
              style: DSTextStyles.sectionHeader.copyWith(
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            DSVSpace.md,
            Text(
              'Please try again',
              style: DSTextStyles.body.copyWith(
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              DSVSpace.xlg,
              DSButton.primary(
                label: 'Retry',
                onPressed: onRetry!,
                width: 150.w,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Pre-configured screen variants
class DSScreen {
  /// Basic screen with AppBar
  static CustomScreen basic({
    required String title,
    required Widget body,
    Widget? appBarEndWidget,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomScreen(
      title: title,
      body: body,
      appBarEndWidget: appBarEndWidget,
      padding: padding,
    );
  }

  /// Screen without AppBar
  static CustomScreen noAppBar({
    required Widget body,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
  }) {
    return CustomScreen(
      body: body,
      showAppBar: false,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }

  /// Screen with bottom navigation
  static CustomScreen withBottomNav({
    required String title,
    required Widget body,
    required Widget bottomNavigationBar,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomScreen(
      title: title,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      padding: padding,
    );
  }

  /// Screen with FAB
  static CustomScreen withFAB({
    required String title,
    required Widget body,
    required Widget floatingActionButton,
    FloatingActionButtonLocation? fabLocation,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomScreen(
      title: title,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: fabLocation,
      padding: padding,
    );
  }

  /// Loading screen
  static CustomScreen loading({
    String? title,
    Widget? loadingWidget,
  }) {
    return CustomScreen(
      title: title,
      body: SizedBox.shrink(),
      isLoading: true,
      loadingWidget: loadingWidget,
    );
  }

  /// Error screen
  static CustomScreen error({
    String? title,
    Widget? errorWidget,
    VoidCallback? onRetry,
  }) {
    return CustomScreen(
      title: title,
      body: SizedBox.shrink(),
      hasError: true,
      errorWidget: errorWidget,
      onRetry: onRetry,
    );
  }

  /// Form screen (no scroll, keyboard aware)
  static CustomScreen form({
    required String title,
    required Widget body,
    Widget? appBarEndWidget,
    bool hideBackButton = false,
  }) {
    return CustomScreen(
      title: title,
      body: body,
      appBarEndWidget: appBarEndWidget,
      hideBackButton: hideBackButton,
      enableScroll: false, // Form handles its own scroll
      resizeToAvoidBottomInset: true, // Move for keyboard
      padding: DSEdgeInsets.screen,
    );
  }

  /// Details screen (scrollable content)
  static CustomScreen details({
    required String title,
    required Widget body,
    Widget? appBarEndWidget,
    ScrollController? scrollController,
  }) {
    return CustomScreen(
      title: title,
      body: body,
      appBarEndWidget: appBarEndWidget,
      enableScroll: true,
      scrollPhysics: const BouncingScrollPhysics(),
      scrollController: scrollController,
      padding: DSEdgeInsets.screen,
    );
  }

  /// Full screen (no padding, no safe area)
  static CustomScreen fullScreen({
    required Widget body,
    bool showAppBar = false,
    String? title,
  }) {
    return CustomScreen(
      title: title,
      body: body,
      showAppBar: showAppBar,
      useSafeArea: false,
      padding: EdgeInsets.zero,
    );
  }

  /// Tab screen (for use with TabBarView)
  static CustomScreen tab({
    required Widget body,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomScreen(
      body: body,
      showAppBar: false,
      padding: padding ?? DSEdgeInsets.screen,
      enableScroll: true,
    );
  }
}

/// Usage Examples:
/// 
/// // Basic screen
/// CustomScreen(
///   title: 'Home',
///   body: Column(
///     children: [
///       Text('Welcome'),
///       DSVSpace.md,
///       DSButton.primary(label: 'Click', onPressed: () {}),
///     ],
///   ),
/// )
/// 
/// // Screen with custom AppBar action
/// CustomScreen(
///   title: 'Settings',
///   appBarEndWidget: IconButton(
///     icon: Icon(Icons.more_vert),
///     onPressed: () {},
///   ),
///   body: SettingsContent(),
/// )
/// 
/// // Loading state
/// CustomScreen(
///   title: 'Profile',
///   isLoading: _isLoading,
///   body: ProfileContent(),
/// )
/// 
/// // Error state with retry
/// CustomScreen(
///   title: 'Data',
///   hasError: _hasError,
///   onRetry: () => _loadData(),
///   body: DataContent(),
/// )
/// 
/// // Form screen
/// DSScreen.form(
///   title: 'Login',
///   body: LoginForm(),
/// )
/// 
/// // No AppBar screen
/// DSScreen.noAppBar(
///   body: OnboardingContent(),
///   backgroundColor: Colors.blue,
/// )
/// 
/// // Screen with bottom navigation
/// DSScreen.withBottomNav(
///   title: 'Home',
///   body: HomeContent(),
///   bottomNavigationBar: CustomBottomNav(),
/// )
/// 
/// // Using copyWith
/// final baseScreen = CustomScreen(
///   title: 'Base',
///   body: Content(),
/// );
/// 
/// final customScreen = baseScreen.copyWith(
///   appBarBackgroundColor: Colors.blue,
///   backgroundColor: Colors.blue.shade50,
/// );