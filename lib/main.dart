import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:get/get.dart';
import 'package:restlogin/manger/Login_cubit/login_cubit_cubit.dart';
import 'package:restlogin/views/LoginView.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the LoginCubitCubit to the widget tree
      create: (context) => LoginCubitCubit(),
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(), // Set LoginView as the home page
      ),
    );
  }
}