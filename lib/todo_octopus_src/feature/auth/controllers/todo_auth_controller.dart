import 'package:flutter/foundation.dart';
import 'package:routing/octopus_src/common/models/user.dart';

final class TodoAuthController with ChangeNotifier {
  User user = UnauthenticatedUser();

  void authenticate({
    required void Function() navigate,
  }) {
    user = AuthenticatedUser(id: "1");
    notifyListeners();
    navigate();
  }

  void logout() {
    user = UnauthenticatedUser();
    notifyListeners();
  }
}
