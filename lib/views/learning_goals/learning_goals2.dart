import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/components/learning_goals/row_widget.dart';
import 'package:gyaanplant_learning_app/components/learning_goals/text_subText_widget.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/page_transition/page_transition.dart';
import 'package:gyaanplant_learning_app/views/fill_profile_screen/fill_profile.dart';

class LearningGoals2 extends StatefulWidget {
  const LearningGoals2({super.key});

  @override
  State<LearningGoals2> createState() => _LearningGoals2State();
}

class _LearningGoals2State extends State<LearningGoals2> {
  List<String> selectedGoals = [];

  void toggleGoalSelection(String goal) {
    setState(() {
      if (selectedGoals.contains(goal)) {
        selectedGoals.remove(goal);
      } else {
        selectedGoals.add(goal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GoalTextBodyWidget(
                heading: 'Choose Category',
                subText:
                    'Choose your learning category or interest\n to continue',
              ),
              LearningGoalsRowWidget(
                image1: Image.asset('assets/images/learning_goals/Fill_10.png'),
                text1: '3D Design',
                image2: Image.asset('assets/images/learning_goals/ICON.png'),
                text2: 'SEO & Marketing',
                selectedGoals: selectedGoals,
                onTap: toggleGoalSelection,
              ),
              LearningGoalsRowWidget(
                image1: Image.asset('assets/images/learning_goals/ICON1.png'),
                text1: 'UI/UX Design',
                image2: Image.asset('assets/images/learning_goals/ICON2.png'),
                text2: 'HR Management',
                selectedGoals: selectedGoals,
                onTap: toggleGoalSelection,
              ),
              LearningGoalsRowWidget(
                image1: Image.asset('assets/images/learning_goals/ICON3.png'),
                text1: 'Web Development',
                image2: Image.asset('assets/images/learning_goals/ICON4.png'),
                text2: 'Office Productivity',
                selectedGoals: selectedGoals,
                onTap: toggleGoalSelection,
              ),
              SizedBox(
                height: 15.0,
              ),
              GreenButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                      context,
                      // MaterialPageRoute(
                      //   builder: (context) => FillProfileScreen(),
                      // ),
                      SlideLeftRoute(page: FillProfileScreen()));
                },
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
