import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restlogin/colors.dart';
import 'package:restlogin/repos/loginrepo.dart';
import 'package:restlogin/repos/loginrepo_impl.dart';


class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // Replace AuthenticationService with LoginRepoImpl
  final LoginRepo _authService = LoginRepoImpl();

  Future<void> submit(BuildContext context) async {
    if (context.mounted) {
      await _authService.submit(
        context: context,
        username: username,
        password: password,
        showMessage: showMessage,
      );
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