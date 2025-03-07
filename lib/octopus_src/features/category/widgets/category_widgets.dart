import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/octopus_src/common/routing/routes.dart';

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({super.key, required this.category});

  final String category;

  @override
  State<CategoryWidgets> createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category widget: ${widget.category}")),
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
                  Octopus.maybeOf(context)?.setState((states) {
                    return states..add(
                      AppRoute.category.node(
                        arguments: {"categoryId": subcategoryId},
                      ),
                    );
                  });
                },
              );
            },
          ),

          SliverToBoxAdapter(child: Divider()),

          // products //
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final productId = widget.category.hashCode + index;
              return ListTile(
                title: Text("Product: $index | $productId"),
                onTap: () {
                  Octopus.maybeOf(context)?.setState((states) {
                    return states..add(
                      AppRoute.product.node(
                        arguments: {"productId": productId.toString()},
                      ),
                    );
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
