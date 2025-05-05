import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gyaanplant_learning_app/views/assessmet/assessmet.dart';
import 'package:gyaanplant_learning_app/views/course_video/my_course.dart';
import 'package:gyaanplant_learning_app/views/home/home.dart';
import 'package:gyaanplant_learning_app/views/library/library.dart';
import 'package:gyaanplant_learning_app/views/user_profile/profile.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  bool showCourseScreen = false;

  // final List<Widget> _screens = [
  //   HomeScreen(),
  //   LibraryScreen(),
  //   Placeholder(), // Example third tab (e.g., Profile)
  // ];

  final List<Widget> _screens = const [
    HomeContent(),
    LibraryScreen(),
    AssessmetScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showCourseScreen
          ? MyCourse() // show course screen inside layout
          : _screens[_currentIndex],
      bottomNavigationBar: showCourseScreen
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              items: [
                _navItem('category.svg', 'sel_category.svg', 'Home'),
                _navItem('video-play.svg', 'sel_video-play.svg', 'Library'),
                _navItem(
                    'book-square.svg', 'sel_book-square.svg', 'Assessment'),
                _navItem('profile.svg', 'sel_profile.svg', 'Profile'),
              ],
              onTap: (index) {
                setState(() {
                  showCourseScreen = false; // Go back to tabs
                  _currentIndex = index;
                });
              },
              selectedLabelStyle: _selectedLabelStyle,
              unselectedLabelStyle: _unselectedLabelStyle,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
            )
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              items: [
                _navItem('category.svg', 'sel_category.svg', 'Home'),
                _navItem('video-play.svg', 'sel_video-play.svg', 'Library'),
                _navItem(
                    'book-square.svg', 'sel_book-square.svg', 'Assessment'),
                _navItem('profile.svg', 'sel_profile.svg', 'Profile'),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedLabelStyle: _selectedLabelStyle,
              unselectedLabelStyle: _unselectedLabelStyle,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
            ),
    );
  }

  void openCourseScreen() {
    setState(() {
      showCourseScreen = true;
    });
  }
}

BottomNavigationBarItem _navItem(String icon, String activeIcon, String label) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/images/navBar/$icon'),
    activeIcon: SvgPicture.asset('assets/images/navBar/$activeIcon'),
    label: label,
  );
}

const _selectedLabelStyle = TextStyle(
  fontFamily: 'Gilroy',
  fontSize: 11.0,
  color: Color.fromRGBO(61, 34, 160, 1),
  height: 2,
  fontWeight: FontWeight.w600,
);

const _unselectedLabelStyle = TextStyle(
  fontFamily: 'Gilroy',
  fontSize: 11.0,
  color: Color.fromRGBO(149, 151, 168, 1),
  height: 2,
  fontWeight: FontWeight.w500,
);


// BottomNavigationBar(
          //   currentIndex: showCourseScreen ? -1 : _currentIndex,
          //   showUnselectedLabels: true,
          //   selectedLabelStyle: const TextStyle(
          //     fontFamily: 'Gilroy',
          //     fontSize: 11.0,
          //     color: Color.fromRGBO(61, 34, 160, 1),
          //     height: 2,
          //     fontWeight: FontWeight.w600,
          //   ),
          //   unselectedLabelStyle: const TextStyle(
          //     fontFamily: 'Gilroy',
          //     fontSize: 11.0,
          //     color: Color.fromRGBO(149, 151, 168, 1),
          //     height: 2,
          //     fontWeight: FontWeight.w500,
          //   ),
          //   type: BottomNavigationBarType.fixed,
          //   onTap: (index) {
          //     setState(() {
          //       _currentIndex = index;
          //       showCourseScreen = false; // return to normal tab
          //     });
          //   },

          // items: const [
          //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //   BottomNavigationBarItem(
          //       icon: Icon(Icons.video_library), label: 'Library'),
          //   BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // ],

          // items: [
          //   BottomNavigationBarItem(
          //     icon: SvgPicture.asset('assets/images/navBar/category.svg'),
          //     activeIcon:
          //         SvgPicture.asset('assets/images/navBar/sel_category.svg'),
          //     label: 'Home',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: SvgPicture.asset('assets/images/navBar/video-play.svg'),
          //     activeIcon:
          //         SvgPicture.asset('assets/images/navBar/sel_video-play.svg'),
          //     label: 'Library',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: SvgPicture.asset('assets/images/navBar/book-square.svg'),
          //     activeIcon:
          //         SvgPicture.asset('assets/images/navBar/sel_book-square.svg'),
          //     label: 'Assessment',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: SvgPicture.asset('assets/images/navBar/profile.svg'),
          //     activeIcon:
          //         SvgPicture.asset('assets/images/navBar/sel_profile.svg'),
          //     label: 'Profile',
          //   ),
          // ],