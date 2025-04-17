import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/views/assessmet/web_dev/web_dev_assessment1.dart';

class SelectAssessmentCategory extends StatelessWidget {
  const SelectAssessmentCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0,
              offset: Offset(0, 0),
              color: Color.fromRGBO(179, 32, 115, 0.18),
            )
          ]),
          child: AppBar(
            title: const Text(
              'Select Category',
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
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Center(
            child: Text(
              'Select Assessment Category',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 85,
          ),
          Column(
            children: [
              SelectCourse(
                image1:
                    Image.asset('assets/images/assessment/Rectangle959.png'),
                text1: 'Course 1',
                image2: Image.asset('assets/images/assessment/image.png'),
                text2: 'Course 2',
                onPressed1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebDevAssessmentPg1(),
                    ),
                  );
                },
                onPressed2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebDevAssessmentPg1(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              SelectCourse(
                image1: Image.asset('assets/images/assessment/image1.png'),
                text1: 'Designing',
                image2: Image.asset('assets/images/assessment/image2.png'),
                text2: 'Coding',
                onPressed1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebDevAssessmentPg1(),
                    ),
                  );
                },
                onPressed2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebDevAssessmentPg1(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SelectCourse extends StatelessWidget {
  final Image image1;
  final String text1;
  final Image image2;
  final String text2;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  SelectCourse({
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: onPressed1,
          child: Column(
            children: [
              image1,
              SizedBox(
                height: 10,
              ),
              Text(
                text1,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onPressed2,
          child: Column(
            children: [
              image2,
              SizedBox(
                height: 10,
              ),
              Text(
                text2,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
