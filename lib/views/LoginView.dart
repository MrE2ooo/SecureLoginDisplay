import 'package:flutter/material.dart';
import 'package:restlogin/views/login.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Login(),
    );
  }
}