import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:routing/go_router_src/features/init/widgets/material_gr_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AppGrRunner {
  Future<void> init() async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        final sharedPreferences = await SharedPreferences.getInstance();
        runApp(
          MaterialGrContextApp(
            sharedPreferences: sharedPreferences,
          ),
        );
      },
      (error, stackStrace) {},
    );
  }
}
