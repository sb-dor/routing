import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    super.key,
    required this.initialPages,
  });

  static _AppNavigatorState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_AppNavigatorState>();

  /// this function of pages ([fn] function which is down below)
  /// is necessary to show user all current [pages] that he is right now
  /// for example if he was pushed in two widgets and
  /// he wants to push to another one we have to send him current [pages],
  /// if he wants to push with current [pages] he will use those [pages]
  /// otherwise he will just add new [pages] in stack
  static void change(BuildContext context, List<Page<Object?>> Function(List<Page<Object?>>) fn) {
    context.findAncestorStateOfType<_AppNavigatorState>()?.change(fn);
  }

  /// for getting all pages
  /// you can to something with these pages, for ex: create breadcrumbs
  static List<Page<Object?>> allPages(BuildContext context) {
    return context.findAncestorStateOfType<_AppNavigatorState>()?._pages ?? <Page<Object?>>[];
  }

  final List<Page<Object?>> initialPages;

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  //
  List<Page<Object?>> _pages = <Page<Object?>>[];

  @override
  void initState() {
    super.initState();
    // _pages.addAll(widget.initialPages.map(
    //   (page) => MaterialPage(child: page),
    // ));
    _pages.addAll(widget.initialPages);
  }

  void change(List<Page<Object?>> Function(List<Page<Object?>>) fn) {
    final newPages = fn(_pages);
    if (identical(_pages, newPages)) return;
    if (_pages.isEmpty) return;
    if (listEquals(_pages, newPages)) return;
    setState(() => _pages = newPages);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _pages,
      onDidRemovePage: (route) {
        if (!route.canPop) return;
        if (_pages.length > 1) {
          _pages.removeLast();
        }
      },
    );
  }
}
