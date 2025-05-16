import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/shared_preferences/user_shared_preferences.dart';
import 'package:gyaanplant_learning_app/views/main_navigation.dart';
import 'package:gyaanplant_learning_app/views/onboarding/onboarding1.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  Future<bool> checkLoginStatus() async {
    return await UserPreferences.getIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final isLoggedIn = snapshot.data ?? false;
          return isLoggedIn ? const MainNavigation() : const OnBoarding1();
        }
      },
    );
  }
}
