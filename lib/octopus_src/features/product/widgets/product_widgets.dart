import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/src/common/routing/app_navigator.dart';

class ProductWidgets extends StatefulWidget {
  const ProductWidgets({
    super.key,
    required this.productId,
  });

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
              AppNavigator.change(context, (pages) => [pages.first]); // navigate to the first page
            },
            icon: Icon(Icons.shortcut),
          ),
          IconButton(
            onPressed: () {
              AppNavigator.change(context, (pages) => [pages.first]); // navigate to the first page
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            final pages = Octopus.maybeOf(context)?.history ?? [];
            return Wrap(
              spacing: 10,
              children: pages.mapIndexed((index, page) {
                return TextButton(
                  onPressed: () {
                    // Octopus.maybeOf(context)?.setState(
                    //   (state) {
                    //     return state..findAllByName(page.state.uri.path);
                    //   },
                    // );
                  },
                  child: Text(page.state.uri.path),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
