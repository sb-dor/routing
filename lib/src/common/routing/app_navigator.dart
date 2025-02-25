import 'package:flutter/material.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  static _AppNavigatorState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_AppNavigatorState>();

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  //
  List<Page<Object?>> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [],
      onDidRemovePage: (route) {},
    );
  }
}
