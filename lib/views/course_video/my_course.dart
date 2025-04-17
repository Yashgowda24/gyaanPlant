import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/views/course_video/course_video.dart';
import 'package:gyaanplant_learning_app/views/home/home.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

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
            centerTitle: true,
            title: const Text(
              'My Course',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LearningProgressCard(),
              CourseSection(
                title: 'My Courses',
                lessons: [
                  LessonCard(
                    isMyCourseScreen: true,
                    progressText: '24/24',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonVideoScreen(
                            lessonNumber: 1,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                    title: 'Web Development',
                  ),
                  LessonCard(
                    isMyCourseScreen: true,
                    progressText: '16/21',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonVideoScreen(
                            lessonNumber: 1,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_3.png',
                    title: 'UI/UX Design',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LessonCard(
                    isMyCourseScreen: true,
                    progressText: '16/21',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonVideoScreen(
                            lessonNumber: 1,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_3.png',
                    title: 'UI/UX Design',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  LessonCard(
                    isMyCourseScreen: true,
                    progressText: '16/21',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonVideoScreen(
                            lessonNumber: 1,
                          ),
                        ),
                      );
                    },
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_3.png',
                    title: 'UI/UX Design',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
