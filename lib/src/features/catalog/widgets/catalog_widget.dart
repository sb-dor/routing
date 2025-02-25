import 'package:flutter/material.dart';
import 'package:routing/src/common/routing/app_navigator.dart';
import 'package:routing/src/features/category/widgets/category_widgets.dart';

class CatalogWidget extends StatefulWidget {
  const CatalogWidget({super.key});

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog widget"),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              AppNavigator.change(
                context,
                (pages) {
                  // use previous pages if you want or add new pages to stack
                  return [
                    ...pages, // using prev pages
                    MaterialPage(
                      key: ValueKey<String>("Category#plumbings"),
                      child: CategoryWidgets(category: "Plumbings"),
                    ),
                  ];
                },
              );
            },
            child: Text("Plumbings"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CategoryWidgets(
                      category: 'Portables',
                    );
                  },
                ),
              );
            },
            child: Text("Portables"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CategoryWidgets(
                      category: 'electronics',
                    );
                  },
                ),
              );
            },
            child: Text("Electronics"),
          ),
        ],
      ),
    );
  }
}
