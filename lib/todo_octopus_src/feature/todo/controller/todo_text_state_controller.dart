import 'package:flutter/material.dart';

final class TodoTextStateController with ChangeNotifier {
  TodoTextStateController({required final TextEditingController controller})
      : _textEditingController = controller {
    _textEditingController.addListener(_listener);
  }

  final TextEditingController _textEditingController;
  String? error;

  void _listener() {
    if (_textEditingController.text.trim().isEmpty) {
      error = "Field can not be empty";
    } else {
      error = null;
    }
    notifyListeners();
  }

  bool get isValidate {
    _listener();
    return error == null;
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_listener);
    super.dispose();
  }
}
