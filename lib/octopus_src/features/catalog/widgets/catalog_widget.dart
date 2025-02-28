import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/octopus_src/common/routing/routes.dart';
import 'package:routing/octopus_src/features/category/widgets/category_widgets.dart';

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

  void _pushCategory(BuildContext context, String categoryId) {
    Octopus.maybeOf(context)?.setState(
      (state) {
        return state
          ..add(
            AppRoute.category.node(
              arguments: {
                'categoryId': categoryId,
              },
            ),
          );
      },
    );
  }

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
              _pushCategory(context, "Plumbings");
            },
            child: Text("Plumbings"),
          ),
          TextButton(
            onPressed: () {
              _pushCategory(context, "Portables");
            },
            child: Text("Portables"),
          ),
          TextButton(
            onPressed: () {
              _pushCategory(context, "Electronics");
            },
            child: Text("Electronics"),
          ),
          TextButton(
            onPressed: () {
              Octopus.maybeOf(context)?.setState(
                (states) {
                  return states
                    ..add(
                      AppRoute.product.node(),
                    );
                },
              );
            },
            child: Text(
              "Products directly",
            ),
          ),
          TextButton(
            onPressed: () {
              _increment();
            },
            child: Text(
              "$_counter",
            ),
          ),
        ],
      ),
    );
  }
}
