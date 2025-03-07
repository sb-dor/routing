import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/todo_octopus_src/feature/auth/controllers/todo_auth_controller.dart';

class TodoAuthenticationScreen extends StatefulWidget {
  const TodoAuthenticationScreen({super.key});

  @override
  State<TodoAuthenticationScreen> createState() => _TodoAuthenticationScreenState();
}

class _TodoAuthenticationScreenState extends State<TodoAuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Authentication")),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<TodoAuthController>().authenticate(
              navigate: () {
                // if you want to show authentication screen remove comments
                // if (!mounted) return;
                // context.octopus.setState((states) {
                //   return states;
                // });
              },
            );
          },
          child: Text("Authenticate"),
        ),
      ),
    );
  }
}
