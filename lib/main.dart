import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l/l.dart';

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

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Routing"),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
