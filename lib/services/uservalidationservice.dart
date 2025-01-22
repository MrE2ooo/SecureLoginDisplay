// lib/services/user_validation_service.dart

import 'package:restlogin/models/user.dart';

class UserValidationService {
  String _message = "";

  bool validateUser(User user) {
    if (user.username!.isEmpty || user.password!.isEmpty) {
      _message = "Empty username or password";
      return false;
    }
    return true; // Validation passed
  }

  String get message => _message;
}
