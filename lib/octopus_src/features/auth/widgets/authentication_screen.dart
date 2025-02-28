import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:routing/octopus_src/common/routing/routes.dart';
import 'package:routing/octopus_src/features/auth/controllers/auth_controller.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthController>().authenticate(
              navigate: () {
                if (!mounted) return;
                context.octopus.setState((states) {
                  return states
                    ..clear()
                    ..add(AppRoute.catalog.node());
                });
              },
            );
          },
          child: Text(
            "Authenticate",
          ),
        ),
      ),
    );
  }
}
