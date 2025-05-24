import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/providers/course_provider.dart';
import 'package:gyaanplant_learning_app/views/course_video/lesson_body.dart';
import 'package:gyaanplant_learning_app/views/home/home.dart';
import 'package:gyaanplant_learning_app/views/library/lib_animation/lib_anim.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool showMoreRecommended = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false).fetchCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final courses = courseProvider.courses;
    if (courseProvider.isLoading) {
      return LibraryShimmerAnimation.buildShimmerLoading(context);
    }

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
              'Library',
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
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 30.0, left: 0.0, right: 0.0, bottom: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search videos',
                  hintStyle: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(138, 140, 148, 1),
                  ),
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset('assets/images/home/search-normal.png'),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, // No border line
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            // 🎯 Recommended Section
            CourseSection(
              title: 'Recommended',
              lessons: [
                LessonCard(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LessonBody()),
                    );
                  },
                  image: courses[0].thumbnail,
                  title: courses[0].title,
                ),
                LessonCard(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LessonBody()),
                    );
                  },
                  image: courses[1].thumbnail,
                  title: courses[1].title,
                ),
                if (showMoreRecommended) ...[
                  LessonCard(
                    onPressed: () {},
                    image: courses[1].thumbnail,
                    title: courses[1].title,
                  ),
                  LessonCard(
                    onPressed: () {},
                    image: courses[1].thumbnail,
                    title: courses[1].title,
                  ),
                ]
              ],
              onSeeMorePressed: () {
                setState(() {
                  showMoreRecommended = !showMoreRecommended;
                });
              },
              isSeeMoreExpanded: showMoreRecommended,
            ),

            // 🔽 Recently Viewed Section (hide when See More is active)
            if (!showMoreRecommended)
              CourseSection(
                title: 'Recently viewed',
                lessons: [
                  LessonCard(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LessonBody()),
                      );
                    },
                    image: courses[0].thumbnail,
                    title: courses[0].title,
                  ),
                  LessonCard(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LessonBody()),
                      );
                    },
                    image: courses[1].thumbnail,
                    title: courses[1].title,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
