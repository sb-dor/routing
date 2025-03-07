import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:routing/src/common/routing/app_navigator.dart';
import 'package:routing/src/features/catalog/widgets/catalog_widget.dart';
import 'package:routing/src/features/category/widgets/category_widgets.dart';

void main() => runZonedGuarded(
  () {
    runApp(App());
  },
  (error, stackTrace) {
    l.e("error: $error", stackTrace);
  },
);

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CatalogWidget(),
      builder: (context, child) {
        return AppNavigator(
          initialPages: [
            MaterialPage(
              key: ValueKey<String>("Catalog"), // it's not necessary
              child: CatalogWidget(),
            ),
            MaterialPage(
              key: ValueKey<String>(
                "Category #electronics",
              ), // it's not necessary
              child: CategoryWidgets(category: "electronics"),
            ),
          ],
        );
      },
    );
  }
}
