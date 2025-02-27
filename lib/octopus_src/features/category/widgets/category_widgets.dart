import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/octopus_src/common/routing/routes.dart';
import 'package:routing/octopus_src/features/product/widgets/product_widgets.dart';
import 'package:routing/src/common/routing/app_navigator.dart';

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<CategoryWidgets> createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category widget: ${widget.category}"),
      ),
      body: CustomScrollView(
        slivers: [
          // sub categories //

          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final subcategoryId = "${widget.category} $index";
              return ListTile(
                title: Text("Sub category: $subcategoryId"),
                onTap: () {
                  Octopus.maybeOf(context)?.setState(
                    (states) {
                      return states
                        ..add(
                          AppRoute.category.node(
                            arguments: {
                              "categoryId": subcategoryId,
                            },
                          ),
                        );
                    },
                  );
                  // AppNavigator.change(
                  //   context,
                  //   (pages) {
                  //     // use previous pages if you want or add new pages to stack
                  //     return [
                  //       ...pages, // using prev pages
                  //       MaterialPage(
                  //         key: ValueKey<String>("sub_category#$subcategoryId"),
                  //         child: CategoryWidgets(category: subcategoryId),
                  //         name: "sub_category#$subcategoryId",
                  //       ),
                  //     ];
                  //   },
                  // );
                },
              );
            },
          ),

          SliverToBoxAdapter(
            child: Divider(),
          ),

          // products //

          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final productId = widget.category.hashCode + index;
              return ListTile(
                title: Text("Product: $index"),
                onTap: () {
                  Octopus.maybeOf(context)?.setState(
                    (states) {
                      return states
                        ..add(
                          AppRoute.product.node(
                            arguments: {"productId": productId.toString()},
                          ),
                        );
                    },
                  );
                  // AppNavigator.change(
                  //   context,
                  //   (pages) {
                  //     // use previous pages if you want or add new pages to stack
                  //     return [
                  //       ...pages, // using prev pages
                  //       MaterialPage(
                  //         key: ValueKey<String>("product#$productId"),
                  //         child: ProductWidgets(productId: productId),
                  //         name: "screen:$productId",
                  //       ),
                  //     ];
                  //   },
                  // );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
