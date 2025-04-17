import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/components/login/login_widget.dart';
import 'package:gyaanplant_learning_app/views/learning_goals/learning_goals2.dart';

class LearningGoals1 extends StatelessWidget {
  const LearningGoals1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginWidget(
        image:
            Image.asset('assets/images/onboard/GyaanPlant_Latest_Logo_1.png'),
        heading: 'Learning Goals',
        subText: 'Choose your learning goals to continue',
        buttonText: 'Continue',
        hintText: 'Enter your number',
        isOtpField: false,
        showTextField: false,
        showButton: true,
        customChild: LearningGoalsWidget(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LearningGoals2(),
            ),
          );
        },
      ),
    );
  }
}

class LearningGoalsWidget extends StatefulWidget {
  const LearningGoalsWidget({super.key});

  @override
  State<LearningGoalsWidget> createState() => _LearningGoalsWidgetState();
}

class _LearningGoalsWidgetState extends State<LearningGoalsWidget> {
  final List<Map<String, dynamic>> goals = [
    {"title": "Advance my Career", "selected": true},
    {"title": "Improve Communication", "selected": false},
    {"title": "Improve my efficiency", "selected": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: goals.map((goal) {
          return GestureDetector(
            onTap: () {
              setState(() {
                goal["selected"] = !goal["selected"];
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.86,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: goal["selected"]
                          ? Color(0xFF3D7B42)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Color(0xFF3D7B42),
                        width: 2,
                      ),
                    ),
                    width: 24,
                    height: 24,
                    child: goal["selected"]
                        ? Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(goal["title"],
                        style: GoogleFonts.monda(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
