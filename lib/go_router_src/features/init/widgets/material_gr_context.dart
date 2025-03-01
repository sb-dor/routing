import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/go_router_src/common/router/gr_router.dart';
import 'package:routing/go_router_src/features/cart/controller/cart_controller.dart';
import 'package:routing/go_router_src/features/category/controller/category_gr_controller.dart';
import 'package:routing/go_router_src/features/init/logic/gr_factories.dart';

class MaterialGrContextApp extends StatelessWidget {
  const MaterialGrContextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryGrController>(
          create: (_) => categoryGrController(),
        ),
        ChangeNotifierProvider<CartController>(
          create: (_) => cartController(),
        ),
      ],
      child: MaterialGrContext(),
    );
  }
}

class MaterialGrContext extends StatefulWidget {
  const MaterialGrContext({super.key});

  @override
  State<MaterialGrContext> createState() => _MaterialGrContextState();
}

class _MaterialGrContextState extends State<MaterialGrContext> with GrRouter {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}
