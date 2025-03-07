import 'package:flutter/material.dart';
import 'package:routing/src/common/routing/app_navigator.dart';
import 'package:routing/src/features/category/widgets/category_widgets.dart';

class CatalogWidget extends StatefulWidget {
  const CatalogWidget({super.key});

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  // state will be saved event if navigator changes, if pages change in stack
  int _counter = 1;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog widget")),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              AppNavigator.change(context, (pages) {
                // use previous pages if you want or add new pages to stack
                return [
                  ...pages, // using prev pages
                  MaterialPage(
                    key: ValueKey<String>("Category#plumbings"),
                    child: CategoryWidgets(category: "Plumbings"),
                    name: "Plumbings",
                  ),
                ];
              });
            },
            child: Text("Plumbings"),
          ),
          TextButton(
            onPressed: () {
              AppNavigator.change(context, (pages) {
                // use previous pages if you want or add new pages to stack
                return [
                  ...pages, // using prev pages
                  MaterialPage(
                    key: ValueKey<String>("Category#portables"),
                    child: CategoryWidgets(category: "Portables"),
                    name: "Portables",
                  ),
                ];
              });
            },
            child: Text("Portables"),
          ),
          TextButton(
            onPressed: () {
              AppNavigator.change(context, (pages) {
                // use previous pages if you want or add new pages to stack
                return [
                  ...pages, // using prev pages
                  MaterialPage(
                    key: ValueKey<String>("Category#electronics"),
                    child: CategoryWidgets(category: "Electronics"),
                    name: "Electronics",
                  ),
                ];
              });
            },
            child: Text("Electronics"),
          ),
          TextButton(
            onPressed: () {
              _increment();
            },
            child: Text("$_counter"),
          ),
        ],
      ),
    );
  }
}
