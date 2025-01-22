import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restlogin/colors.dart';
import 'package:restlogin/models/user.dart';
import 'package:restlogin/models/userresponse.dart';
import 'package:restlogin/services/authentication_service.dart';
import 'package:restlogin/services/uservalidationservice.dart';
import 'package:restlogin/views/homepage.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final AuthenticationService _authService = AuthenticationService();
  final UserValidationService _validationService = UserValidationService();

  Future<void> submit(BuildContext context) async {
    print("Submitting");
    User user = User(username: username.text.trim(), password: password.text.trim());

    bool validateResult = _validationService.validateUser(user);
    if (validateResult) {
      List<UserResponse>? authResult = await _authService.authenticateUser(user);
      if (authResult != null && authResult.isNotEmpty) {
        // Navigate to the Home Page on successful login
        Get.to(() => HomePage(userDetails: authResult));
      } else {
        showMessage(context: context, title: "Login Status", message: "Failed to authenticate user.");
      }
    } else {
      showMessage(context: context, title: "Login Status", message: _validationService.message);
    }
  }

  void showMessage({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              "OK",
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
