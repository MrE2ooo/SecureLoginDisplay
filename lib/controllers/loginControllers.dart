import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restlogin/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restlogin/manger/Login_cubit/login_cubit_cubit.dart';
import 'package:restlogin/views/homepage.dart'; 

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> submit(BuildContext context) async {
    if (context.mounted) {
      // Access the LoginCubitCubit using BlocProvider
      final loginCubit = BlocProvider.of<LoginCubitCubit>(context);

      // Trigger the login process
      loginCubit.login(
        username: username.text.trim(),
        password: password.text.trim(),
      );

      // Listen to the cubit's state changes
      loginCubit.stream.listen((state) {
        if (!context.mounted) return; // Check if the context is still valid

        if (state is LoginSuccess) {
          // Navigate to the home page on successful login
          Get.to(() => HomePage(userDetails: state.userDetails));
        } else if (state is LoginFailure) {
          // Show error message on failure
          showMessage(
            context: context,
            title: "Login Status",
            message: state.message,
          );
        }
      });
    }
  }

  void showMessage({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    if (!context.mounted) return; // Check if the context is still valid

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