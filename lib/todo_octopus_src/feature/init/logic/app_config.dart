import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:routing/todo_octopus_src/feature/init/widgets/material_context.dart';

class TodoAppConfig {
  Future<void> init() async {
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        runApp(TodoAppMaterialContext());
      },
      (error, stackTrace) {
        //
      },
    );
  }
}
