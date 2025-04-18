import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/views/course_video/course_video.dart';
import 'package:gyaanplant_learning_app/views/home/home.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool showMoreRecommended = false;

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
            EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search videos',
                // contentPadding: const EdgeInsets.symmetric(
                //     vertical: 15.0, horizontal: 20.0),
                hintStyle: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(138, 140, 148, 1),
                ),
                filled: true,
                // fillColor: Colors.grey,
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
                      MaterialPageRoute(
                          builder: (context) =>
                              LessonVideoScreen(lessonNumber: 1)),
                    );
                  },
                  image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                  title: 'Lesson 1 | Course 1 \nChapter 1',
                ),
                LessonCard(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LessonVideoScreen(lessonNumber: 1)),
                    );
                  },
                  image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                  title: 'Lesson 2 | Course 1 \nChapter 1',
                ),
                if (showMoreRecommended) ...[
                  LessonCard(
                    onPressed: () {},
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                    title: 'Lesson 3 | Course 1 \nChapter 2',
                  ),
                  LessonCard(
                    onPressed: () {},
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                    title: 'Lesson 4 | Course 2 \nChapter 1',
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
                        MaterialPageRoute(
                            builder: (context) =>
                                LessonVideoScreen(lessonNumber: 1)),
                      );
                    },
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                    title: 'Lesson 1 | Course 1 \nChapter 1',
                  ),
                  LessonCard(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LessonVideoScreen(lessonNumber: 1)),
                      );
                    },
                    image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                    title: 'Lesson 2 | Course 1 \nChapter 1',
                  ),
                  // CourseSection(
                  //   title: 'Recommended',
                  //   lessons: [
                  //     LessonCard(
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LessonVideoScreen(
                  //               lessonNumber: 1,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                  //       title: 'Lesson 1 | Course 1 \nChapter 1',
                  //     ),
                  //     LessonCard(
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LessonVideoScreen(
                  //               lessonNumber: 1,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                  //       title: 'Lesson 2 | Course 1 \nChapter 1',
                  //     ),
                  //   ],
                  // ),
                  // CourseSection(
                  //   title: 'Recently viewed',
                  //   lessons: [
                  //     LessonCard(
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LessonVideoScreen(
                  //               lessonNumber: 1,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                  //       title: 'Lesson 1 | Course 1 \nChapter 1',
                  //     ),
                  //     LessonCard(
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LessonVideoScreen(
                  //               lessonNumber: 1,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                  //       title: 'Lesson 2 | Course 1 \nChapter 1',
                  //     ),
                  //   ],
                  // ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
