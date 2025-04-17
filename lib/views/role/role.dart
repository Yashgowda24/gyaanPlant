import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/components/login/login_widget.dart';
import 'package:gyaanplant_learning_app/views/learning_goals/learning_goals1.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  void navigateToNext(BuildContext context, String role) {
    // You can customize this to navigate to different screens
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LearningGoals1(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginWidget(
              image: Image.asset(
                  'assets/images/onboard/GyaanPlant_Latest_Logo_1.png'),
              heading: 'Roles Selection',
              subText: 'Choose your role to continue',
              buttonText: 'Continue',
              hintText: 'Enter your number',
              isOtpField: false,
              showTextField: false,
              showButton: false,
              onPressed: () {
                print('pressed!');
              },
            ),
            RoleSelector(
              onRoleSelected: (role) {
                navigateToNext(context, role);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoleSelector extends StatefulWidget {
  final void Function(String selectedRole) onRoleSelected;

  const RoleSelector({super.key, required this.onRoleSelected});

  @override
  State<RoleSelector> createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  String selectedRole = '';

  Widget buildOption(String role, String imagePath) {
    bool isSelected = selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });

        // 🔥 Navigate to next screen or pass selected role
        widget.onRoleSelected(role);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.green, width: 2)
              : Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 10),
            Text(role,
                style: GoogleFonts.monda(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          buildOption('Candidate', 'assets/images/learning_goals/Student.png'),
          buildOption('Corporate', 'assets/images/learning_goals/Employee.png'),
        ],
      ),
    );
  }
}
