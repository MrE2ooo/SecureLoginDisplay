import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restlogin/colors.dart';
import 'package:restlogin/controllers/loginControllers.dart';
import 'package:restlogin/widgets/InputBox.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return SafeArea(
      child: SingleChildScrollView(
          child: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              InputBox(
                textController: controller.username,
                hint: "username", isSecured: false,
              ),
              const SizedBox(
                height: 20,
              ),
              InputBox(textController: controller.password, hint: "password", isSecured: true,),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width / 2,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () async {
                      
                     controller.submit(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: AppColors.customWhite),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
