import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // method to store the username and user email in shared pref.
  static Future<void> storeUserData(
      {required String userName,
      required String email,
      required String password,
      required String confirmPassword,
      required BuildContext context}) async {
    try {
      // Check the two passwords are the same
      if (password != confirmPassword) {
        // Show a massage to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password and confirm password does not match"),
          ),
        );

        return;
      }

      // Store the details
      // Create an instance from shared pref
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Store the details as ke value pairs
      await prefs.setString("userName", userName);
      await prefs.setString("email", email);

      // Show a massage to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User details stored successfully"),
        ),
      );
    } catch (e) {
      e.toString();
    }
  }
}
