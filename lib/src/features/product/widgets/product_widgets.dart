import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:routing/src/common/routing/app_navigator.dart';

class ProductWidgets extends StatefulWidget {
  const ProductWidgets({super.key, required this.productId});

  final int productId;

  @override
  State<ProductWidgets> createState() => _ProductWidgetsState();
}

class _ProductWidgetsState extends State<ProductWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product widget: ${widget.productId}"),
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.change(
                context,
                (pages) => [pages.first],
              ); // navigate to the first page
            },
            icon: Icon(Icons.shortcut),
          ),
          IconButton(
            onPressed: () {
              AppNavigator.change(
                context,
                (pages) => [pages.first],
              ); // navigate to the first page
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            final pages = AppNavigator.allPages(context);
            return Wrap(
              children:
                  pages.mapIndexed((index, page) {
                    return TextButton(
                      onPressed: () {
                        AppNavigator.change(context, (pages) {
                          List<Page<Object?>> newPages = [];
                          for (int i = 0; i < pages.length; i++) {
                            newPages.add(pages[i]);
                            if (pages[i].key == page.key) {
                              break;
                            }
                          }
                          return newPages;
                        });
                      },
                      child: Text((page.key as ValueKey<String>).value),
                    );
                  }).toList(),
            );
          },
        ),
      ),
    );
  }
}
