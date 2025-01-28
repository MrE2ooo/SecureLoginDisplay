import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restlogin/models/user.dart';
import 'package:restlogin/models/userresponse.dart';
import 'package:restlogin/repos/loginrepo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:restlogin/views/homepage.dart';

class LoginRepoImpl implements LoginRepo {
  final Dio dio;
  String _message = "";

  LoginRepoImpl({Dio? dio})
      : dio = dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 8)));

  @override
  Future<List<UserResponse>?> authenticateUser(User user) async {
    String apiUrl = "https://dummyjson.com/auth/login";

    try {
      Map<String, dynamic> requestData = {
        "username": user.username,
        "password": user.password,
        "expiresInMins": 30, // Optional parameter
      };

      final response = await dio.post(apiUrl, data: requestData);
      if (response.statusCode == 200) {
        UserResponse userResponse = UserResponse.fromJson(response.data);
        return [userResponse]; // Store response in a list
      } else {
        return null;
      }
    } catch (e) {
      print(e); // Print the error for debugging
      return null;
    }
  }

  @override
  Future<void> submit({
    required BuildContext context,
    required TextEditingController username,
    required TextEditingController password,
    required Function showMessage,
  }) async {
    print("Submitting");
    User user = User(username: username.text.trim(), password: password.text.trim());

    bool validateResult = validateUser(user);
    if (validateResult) {
      List<UserResponse>? authResult = await authenticateUser(user);
      if (authResult != null && authResult.isNotEmpty) {
        // Navigate to the Home Page on successful login
        if (context.mounted) {
          Get.to(() => HomePage(userDetails: authResult));
        }
      } else {
        if (context.mounted) {
          showMessage(context: context, title: "Login Status", message: "Failed to authenticate user.");
        }
      }
    } else {
      if (context.mounted) {
        showMessage(context: context, title: "Login Status", message: _message);
      }
    }
  }

  @override
  bool validateUser(User user) {
    if (user.username!.isEmpty || user.password!.isEmpty) {
      _message = "Empty username or password";
      return false;
    }
    return true; // Validation passed
  }

  @override
  String get message => _message;
}