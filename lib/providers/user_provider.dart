import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// todo: let me check later, not user yet!
class UserProvider extends ChangeNotifier {
  String? name;
  String? email;
  String? profilePic;

  void updateUser({String? newName, String? newEmail, String? newProfilePic}) {
    name = newName ?? name;
    email = newEmail ?? email;
    profilePic = newProfilePic ?? profilePic;
    notifyListeners();
  }

  void loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('userName');
    email = prefs.getString('userEmail');
    profilePic = prefs.getString('useuserProfilePicrProf');
    notifyListeners();
  }
}
