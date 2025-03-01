import 'package:flutter/material.dart';
import 'package:routing/go_router_src/common/router/gr_router.dart';

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

class _MaterialGrContextState extends State<MaterialGrContext> with GrRouter {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}
