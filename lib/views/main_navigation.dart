import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gyaanplant_learning_app/views/assessmet/assessmet.dart';
import 'package:gyaanplant_learning_app/views/jobs/jobs.dart';
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

  final List<Widget> _screens = [
    const HomeContent(),
    const LibraryScreen(),
    const AssessmetScreen(),
    const JobsScreen(),
    const UserProfileScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
      showCourseScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showCourseScreen ? const JobsScreen() : _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: showCourseScreen ? _currentIndex : _currentIndex,
      items: [
        _navItem('category.svg', 'sel_category.svg', 'Home'),
        _navItem('video-play.svg', 'sel_video-play.svg', 'Library'),
        _navItem('book-square.svg', 'sel_book-square.svg', 'Assessment'),
        _navItem('find-jobs.svg', 'sel_find_jobs.svg', 'Jobs'),
        _navItem('profile.svg', 'sel_profile.svg', 'Profile'),
      ],
      onTap: (index) {
        setState(() {
          if (showCourseScreen) {
            showCourseScreen = false;
          }
          _currentIndex = index;
        });
      },
      selectedLabelStyle: _selectedLabelStyle,
      unselectedLabelStyle: _unselectedLabelStyle,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
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

// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});

//   @override
//   State<MainNavigation> createState() => MainNavigationState();
// }

// class MainNavigationState extends State<MainNavigation> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;
//   bool showCourseScreen = false;

//   void changeTab(int index) {
//     setState(() {
//       _currentIndex = index;
//       showCourseScreen = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HeroControllerScope(
//         controller: HeroController(),
//         child: PageView(
//           controller: _pageController,
//           physics: const NeverScrollableScrollPhysics(), // Disable swipe
//           children: const [
//             HomeContent(),
//             LibraryScreen(),
//             AssessmetScreen(),
//             JobsScreen(),
//             UserProfileScreen(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   BottomNavigationBar _buildBottomNavBar() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       items: [
//         _navItem('category.svg', 'sel_category.svg', 'Home'),
//         _navItem('video-play.svg', 'sel_video-play.svg', 'Library'),
//         _navItem('book-square.svg', 'sel_book-square.svg', 'Assessment'),
//         _navItem('find-jobs.svg', 'sel_find_jobs.svg', 'Jobs'),
//         _navItem('profile.svg', 'sel_profile.svg', 'Profile'),
//       ],
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//           _pageController.animateToPage(
//             index,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeOut,
//           );
//         });
//       },
//       selectedLabelStyle: _selectedLabelStyle,
//       unselectedLabelStyle: _unselectedLabelStyle,
//       type: BottomNavigationBarType.fixed,
//       showUnselectedLabels: true,
//     );
//   }

//   BottomNavigationBarItem _navItem(
//       String icon, String activeIcon, String label) {
//     return BottomNavigationBarItem(
//       icon: SvgPicture.asset('assets/images/navBar/$icon'),
//       activeIcon: SvgPicture.asset('assets/images/navBar/$activeIcon'),
//       label: label,
//     );
//   }

//   final _selectedLabelStyle = const TextStyle(
//     fontFamily: 'Gilroy',
//     fontSize: 11.0,
//     color: Color.fromRGBO(61, 34, 160, 1),
//     height: 2,
//     fontWeight: FontWeight.w600,
//   );

//   final _unselectedLabelStyle = const TextStyle(
//     fontFamily: 'Gilroy',
//     fontSize: 11.0,
//     color: Color.fromRGBO(149, 151, 168, 1),
//     height: 2,
//     fontWeight: FontWeight.w500,
//   );
// }
