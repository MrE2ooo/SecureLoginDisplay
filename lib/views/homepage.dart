import 'package:flutter/material.dart';
import 'package:restlogin/colors.dart';
import 'package:restlogin/models/userresponse.dart';

class HomePage extends StatelessWidget {
  final List<UserResponse>? userDetails;

  const HomePage({super.key, this.userDetails}); // Modified constructor to accept userDetails

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home Page")),
        backgroundColor: AppColors.primaryColor,
      ),
      body: userDetails != null
          ? ListView.builder(
              itemCount: userDetails!.length,
              itemBuilder: (context, index) {
                final user = userDetails![index];
                return Card(
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      "ID: ${user.id}",
                      style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username: ${user.username}", style: const TextStyle(color: AppColors.primaryColor)),
                        Text("Email: ${user.email}", style: const TextStyle(color: AppColors.primaryColor)),
                        Text("First Name: ${user.firstName}", style: const TextStyle(color: AppColors.primaryColor)),
                        Text("Last Name: ${user.lastName}", style: const TextStyle(color: AppColors.primaryColor)),
                        Text("Gender: ${user.gender}", style: const TextStyle(color: AppColors.primaryColor)),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "Welcome to the Home Page!",
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
