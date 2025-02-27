import 'package:flutter/src/widgets/framework.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/octopus_src/features/catalog/widgets/catalog_widget.dart';
import 'package:routing/octopus_src/features/category/widgets/category_widgets.dart';
import 'package:routing/octopus_src/features/product/widgets/product_widgets.dart';

enum AppRoute with OctopusRoute {
  catalog('catalog'),
  category("category"),
  product("product");

  const AppRoute(this.name);

  @override
  final String name;

  @override
  Widget builder(
    BuildContext context,
    OctopusState state, // https://youtu.be/bIst8LmnrAk?t=5710
    OctopusNode node, // https://youtu.be/bIst8LmnrAk?t=5985
  ) {
    return switch (this) {
      AppRoute.catalog => CatalogWidget(),
      AppRoute.category => CategoryWidgets(category: node.arguments['categoryId'].toString()),
      AppRoute.product => ProductWidgets(productId: int.parse("${node.arguments['productId']}")),
    };
  }
}
