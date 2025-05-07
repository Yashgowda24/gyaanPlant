import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';
import 'package:gyaanplant_learning_app/views/login/login.dart';
import 'package:gyaanplant_learning_app/views/settings/certificate/my_certificate.dart';
import 'package:gyaanplant_learning_app/views/settings/leaderboard/leaderboard.dart';
import 'package:gyaanplant_learning_app/views/settings/user_profile/user_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true); // ✅ Send back "true" if user goes back
        return false; // Prevent default pop, we already handled it
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                  color: Color.fromRGBO(179, 32, 115, 0.18),
                )
              ],
            ),
            child: AppBar(
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 18.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                SettingDisplayWidget(
                  icon: CupertinoIcons.person_circle,
                  text: 'My profile',
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfileSettingScreen(),
                      ),
                    );
                  },
                ),
                SettingDisplayWidget(
                  icon: CupertinoIcons.doc_append,
                  text: 'My Certificates',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCertificateScreen(),
                      ),
                    );
                  },
                ),
                SettingDisplayWidget(
                  icon: CupertinoIcons.doc_plaintext,
                  text: 'Leaderboard',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeaderboardScreen(),
                      ),
                    );
                  },
                ),
                SettingDisplayWidget(
                  icon: Icons.exit_to_app,
                  text: 'Logout',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingDisplayWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const SettingDisplayWidget({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.86,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                spreadRadius: 0,
                offset: Offset(0, 0),
                color: Color.fromRGBO(179, 32, 115, 0.18),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 24,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  text,
                  style: kSettingTextStyle,
                ),
                Spacer(),
                Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
