import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(184, 184, 210, 0.2),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Course Completed - ',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(133, 133, 151, 1),
                                ),
                              ),
                              TextSpan(
                                  text: 'Web Development',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ))
                            ],
                          ),
                        )
                        // Spacer(),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => MyCourse(),
                        //       ),
                        //     );
                        //   },
                        //   child: Text(
                        //     "My courses",
                        //     style: TextStyle(
                        //       fontFamily: 'Gilroy',
                        //       color: Color.fromRGBO(61, 92, 255, 1),
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: const TextSpan(
                        text: '46min',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: ' / 60min',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        children: [
                          Container(
                            height: 6,
                            color: Colors.grey.shade200,
                          ),
                          Container(
                            height: 6,
                            width: MediaQuery.of(context).size.width * 0.7
                            // * progress
                            ,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(255, 255, 255, 0),
                                  Color.fromRGBO(255, 81, 6, 1),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
