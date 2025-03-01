import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/go_router_src/features/cart/widgets/cart_gr_widget.dart';
import 'package:routing/go_router_src/features/category/widgets/category_gr_widget.dart';
import 'package:routing/go_router_src/features/home_gr.dart';
import 'package:routing/go_router_src/features/product/widgets/product_gr_widget.dart';

class MaterialGrContextApp extends StatelessWidget {
  const MaterialGrContextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialGrContext();
  }
}

class MaterialGrContext extends StatefulWidget {
  const MaterialGrContext({super.key});

  @override
  State<MaterialGrContext> createState() => _MaterialGrContextState();
}

class _MaterialGrContextState extends State<MaterialGrContext> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: "/categories",
        routes: [
          ShellRoute(
            routes: [
              GoRoute(
                path: "/categories",
                routes: [
                  GoRoute(
                    path: "products/:productId",
                    builder: (context, state) {
                      return ProductGrWidget(
                        productId: state.pathParameters['productId'] as String,
                      );
                    },
                  ),
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
      ),
    );
  }
}
