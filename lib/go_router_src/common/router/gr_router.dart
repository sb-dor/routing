import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/go_router_src/features/cart/widgets/cart_gr_widget.dart';
import 'package:routing/go_router_src/features/category/widgets/category_gr_widget.dart';
import 'package:routing/go_router_src/features/home_gr.dart';
import 'package:routing/go_router_src/features/product/widgets/product_gr_widget.dart';

mixin GrRouter<T extends StatefulWidget> on State<T> {
  late final GoRouter goRouter;

  @override
  void initState() {
    super.initState();
    goRouter = GoRouter(
      initialLocation: "/categories",
      routes: [
        ShellRoute(
          routes: [
            GoRoute(
              path: "/categories",
              routes: [
                GoRoute(
                  path: "products",
                  builder: (context, state) {
                    return ProductGrWidget(
                      categoryId: state.uri.queryParameters['categoryId'] as String,
                    );
                  },
                ),
                // GoRoute(
                //   path: "products/:categoryId",
                //   builder: (context, state) {
                //     return ProductGrWidget(
                //       categoryId: state.pathParameters['categoryId'] as String,
                //     );
                //   },
                // ),
              ],
              builder: (context, state) => CategoryGrWidget(),
            ),
            GoRoute(
              path: "/cart",
              builder: (context, state) => CartGrWidget(),
            ),
          ],
          builder: (context, state, child) {
            return HomeGr(child: child);
          },
        ),
      ],
    );
  }
}
