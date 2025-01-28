import 'package:flutter/cupertino.dart';
import 'package:restlogin/models/user.dart';
import 'package:restlogin/models/userresponse.dart';

abstract class LoginRepo {
  Future<List<UserResponse>?> authenticateUser(User user);

  Future<void> submit({
    required BuildContext context,
    required TextEditingController username,
    required TextEditingController password,
    required Function showMessage,
  });

  bool validateUser(User user);

  String get message;
}
