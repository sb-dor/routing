import 'dart:async';
import 'package:octopus/octopus.dart';
import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:provider/provider.dart';
import 'package:routing/octopus_src/common/routing/routes.dart';
import 'package:routing/octopus_src/features/auth/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/routing/own_authentication_guard_with_signin_navigation.dart';

// more info for configuring routes:

// Route mixin
// https://github.com/PlugFox/octopus/blob/master/example/lib/src/common/router/router_state_mixin.dart

// AuthenticationGuard
// https://github.com/PlugFox/octopus/blob/master/example/lib/src/common/router/authentication_guard.dart

// user
// https://github.com/PlugFox/octopus/blob/master/example/lib/src/feature/authentication/model/user.dart

void main() => runZonedGuarded(
  () async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPrefer = await SharedPreferences.getInstance();
    runApp(App(sharedPreferences: sharedPrefer));
  },
  (error, stackTrace) {
    l.e("error: $error", stackTrace);
  },
);

class App extends StatelessWidget {
  const App({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthController(),
      child: _AppConfig(sharedPreferences: sharedPreferences),
    );
  }
}

class _AppConfig extends StatefulWidget {
  const _AppConfig({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  State<_AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<_AppConfig> with _AppRoutingWithOctopus {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _octopus.config, // coming from mixin
      builder:
          (context, child) => OctopusTools(
            // for development
            child: child!,
          ),
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (_) => FadeUpwardsPageTransitionsBuilder(),
          ),
        ),
      ),
    );
  }
}

mixin _AppRoutingWithOctopus on State<_AppConfig> {
  late final Octopus _octopus;

  @override
  void initState() {
    super.initState();
    _octopus = Octopus(
      routes: AppRoute.values,
      defaultRoute: AppRoute.catalog,
      guards: [
        OwnAuthenticationGuardWithSignInNavigation(
          // Get current user from authentication controller.
          getUser: () async => context.read<AuthController>().user,
          // Available routes for non authenticated user.
          // in with these routes non authenticated user can navigate to
          guardedRoutes: {
            // AppRoute.authentication.name,
            // AppRoute.catalog.name,
            // AppRoute.category.name,
            AppRoute
                .product
                .name, // only product screen is for authenticated users. Guarded route
          },
          authenticationScreensNames: <String>{AppRoute.authentication.name},
          // Default route for non authenticated user.
          signInNavigation: OctopusState.single(AppRoute.authentication.node()),
          homeNavigation: OctopusState.single(AppRoute.catalog.node()),
          refresh: context.read<AuthController>(),
        ),
      ],
    );
  }
}
