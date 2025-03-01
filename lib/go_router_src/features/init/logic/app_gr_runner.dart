import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:routing/go_router_src/features/init/widgets/material_gr_context.dart';

final class AppGrRunner {
  Future<void> init() async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        runApp(MaterialGrContextApp());
      },
      (error, stackStrace) {},
    );
  }
}
