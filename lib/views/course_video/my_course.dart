import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/providers/course_provider.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';
import 'package:gyaanplant_learning_app/views/course_video/lesson_body.dart';
import 'package:gyaanplant_learning_app/views/home/home.dart';
import 'package:provider/provider.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false).fetchCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _courseProvider = Provider.of<CourseProvider>(context);

    if (_courseProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final _courses = _courseProvider.courses;

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
                                  color: Color.fromRGBO(133, 133, 151, 1),
                                  fontWeight: FontWeight.w400,
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
                      ],
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: '46min',
                        style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          color: Color.fromRGBO(31, 31, 57, 1),
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: ' / 60min',
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Color.fromRGBO(133, 133, 151, 1),
                              fontWeight: FontWeight.w400,
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
                                  Color.fromRGBO(61, 123, 68, 1),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'My courses',
                        style: kHomeCourseStyle,
                      ),
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
                                builder: (context) => LessonBody()
                              ),
                            );
                          },
                          image: _courses[0].thumbnail,
                          title: _courses[0].title,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        LessonCard(
                          isMyCourseScreen: true,
                          progressText: '16/21',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LessonBody()
                              ),
                            );
                          },
                          image: _courses[1].thumbnail,
                          title: _courses[1].title,
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
                                builder: (context) => LessonBody()
                              ),
                            );
                          },
                          image: _courses[2].thumbnail,
                          title: _courses[2].title,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        LessonCard(
                          isMyCourseScreen: true,
                          progressText: '16/21',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LessonBody()
                              ),
                            );
                          },
                          image: _courses[0].thumbnail,
                          title: _courses[0].title,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
