import 'dart:async';
import 'package:octopus/octopus.dart';
import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:routing/octopus_src/common/routing/routes.dart';

void main() => runZonedGuarded(
      () {
        runApp(App());
      },
      (error, stackTrace) {
        l.e("error: $error", stackTrace);
      },
    );

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AppRoutingWithOctopus {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _octopus.config, // coming from mixin
    );
  }
}

mixin AppRoutingWithOctopus on State<App> {
  late final Octopus _octopus;

  @override
  void initState() {
    super.initState();
    _octopus = Octopus(
      routes: AppRoute.values,
    );
  }
}
