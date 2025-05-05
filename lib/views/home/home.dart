import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';
import 'package:gyaanplant_learning_app/views/assessmet/assessmet.dart';
import 'package:gyaanplant_learning_app/views/course_video/course_video.dart';
import 'package:gyaanplant_learning_app/views/library/library.dart';
import 'package:gyaanplant_learning_app/views/main_navigation.dart';
import 'package:gyaanplant_learning_app/views/user_profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeContent(),
    LibraryScreen(),
    AssessmetScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 11.0,
          color: Color.fromRGBO(61, 34, 160, 1),
          height: 2,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 11.0,
          color: Color.fromRGBO(149, 151, 168, 1),
          height: 2,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/category.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_category.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/video-play.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_video-play.svg'),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/book-square.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_book-square.svg'),
            label: 'Assessment',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/profile.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_profile.svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: 30.0, left: 16.0, right: 16.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/onboard/GyaanPlant_Latest_Logo_1.png',
                    height: 60.0,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none_rounded,
                        color: Colors.black),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          LearningProgressCard(),
          const SizedBox(height: 20),
          CourseSection(
            title: 'Course 1',
            lessons: [
              LessonCard(
                image: 'assets/images/home/img.png',
                title: 'Lesson 1 | Course 1',
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
              ),
              LessonCard(
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
                image: 'assets/images/home/unsplash_KW3m50XRhjk.png',
                title: 'Lesson 2 | Course 1',
              ),
            ],
          ),
          CourseSection(
            title: 'Course 2',
            lessons: [
              LessonCard(
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
                title: 'Lesson 1-Education | Course 2',
              ),
              LessonCard(
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
                title: 'Lesson 2-Tutorial | Course 2',
              ),
            ],
          ),
          CourseSection(
            title: 'Course 3',
            lessons: [
              LessonCard(
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
                title: 'Lesson 1 | How to | Course 3',
              ),
              LessonCard(
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
                title: 'Lesson 2 | How to | Course 3',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseSection extends StatefulWidget {
  final String title;
  final List<LessonCard> lessons;
  final VoidCallback? onSeeMorePressed;
  final bool isSeeMoreExpanded;
  final bool showSeeMore; // 👈 NEW: Always show text
  final bool isInteractive; // 👈 NEW: Should it respond

  const CourseSection({
    super.key,
    required this.title,
    required this.lessons,
    this.onSeeMorePressed,
    this.isSeeMoreExpanded = false,
    this.showSeeMore = true, // 👈 Default: true
    this.isInteractive = true, // 👈 Default: true
  });

  @override
  State<CourseSection> createState() => _CourseSectionState();
}

class _CourseSectionState extends State<CourseSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: kHomeCourseStyle,
            ),
            // if (widget.onSeeMorePressed != null)
            //   GestureDetector(
            //     onTap: widget.onSeeMorePressed,
            //     child: Text(
            //       widget.isSeeMoreExpanded ? 'SEE LESS' : 'SEE MORE',
            //       style: kSeeMoreStyle,
            //     ),
            //   )
            /// 👇 This block handles SEE MORE text
            if (widget.showSeeMore)
              GestureDetector(
                onTap: widget.isInteractive ? widget.onSeeMorePressed : null,
                child: Text(
                  widget.isSeeMoreExpanded ? 'SEE LESS' : 'SEE MORE',
                  style: kSeeMoreStyle,
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: widget.lessons,
        ),
      ],
    );
  }
}

class LessonCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;
  final bool isMyCourseScreen;
  final String progressText;

  const LessonCard({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
    this.isMyCourseScreen = false,
    this.progressText = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(image, fit: BoxFit.cover),
                  const Icon(Icons.play_circle_fill,
                      color: Colors.white, size: 40),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: kHomeSubHeadingStyle,
            ),
            const Text(
              'Gyaan Plant',
              style: kGyaanPlantText,
            ),
            if (isMyCourseScreen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FractionallySizedBox(
                        widthFactor: 0.87,
                        child: Stack(
                          children: [
                            Container(
                              height: 6,
                              color: Colors.grey.shade200,
                            ),
                            Container(
                              height: 6,
                              width: MediaQuery.of(context).size.width * 0.7,
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
                    ),
                  ),
                  const Text(
                    'Chapters Completed',
                    style: kGyaanPlantText,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    progressText,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 22.0,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class LearningProgressCard extends StatelessWidget {
  const LearningProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    double learnedMinutes = 46;
    double totalMinutes = 60;
    double progress = learnedMinutes / totalMinutes;

    return Container(
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
              Text(
                "Web Development",
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  // builder: (context) => MyCourse(),
                  //   ),
                  // );
                  (context.findAncestorStateOfType<MainNavigationState>())
                      ?.openCourseScreen();
                },
                child: Text(
                  "MY COURSES",
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 12.0,
                    color: Color.fromRGBO(0, 31, 142, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: '${learnedMinutes.toInt()}min',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(31, 31, 57, 1),
              ),
              children: [
                TextSpan(
                  text: ' / ${totalMinutes.toInt()}min',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Color.fromRGBO(133, 133, 151, 1),
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
                  width: MediaQuery.of(context).size.width * 0.7 * progress,
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
    );
  }
}
