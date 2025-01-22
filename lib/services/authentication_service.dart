import 'package:dio/dio.dart';
import 'package:restlogin/models/user.dart';
import 'package:restlogin/models/userresponse.dart';

class AuthenticationService {
  final Dio dio;

  AuthenticationService({Dio? dio})
      : dio = dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 8)));

  Future<List<UserResponse>?> authenticateUser(User user) async {
    String apiUrl = "https://dummyjson.com/auth/login"; // Renamed variable

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
}
