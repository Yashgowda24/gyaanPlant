// import 'package:flutter/material.dart';
// import 'package:gyaanplant_learning_app/styles/styles.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   final List<OnboardingPage> _pages = [
//     OnboardingPage(
//       image: 'assets/images/onboard/GyaanPlant_Latest_Logo_1.png',
//       buttonText: "Let's Get Started",
//     ),
//     OnboardingPage(
//       image: 'assets/images/onboard/Video-Stream.png',
//       text1: 'Welcome to Gyaan Plant',
//       text2:
//           "Start your learning journey with\nour comprehensive video courses\nand interactive exams",
//       buttonText: 'Next',
//     ),
//     // Add your other 2 pages here
//     OnboardingPage(
//       image: 'assets/images/onboard/image2360.png',
//       text1: 'Collaborate Seamlessly',
//       text2: "Collaborate Seamlessly \n without any interruption",
//       buttonText: 'Next',
//     ),
//     OnboardingPage(
//       image: 'assets/images/onboard/image2361.png',
//       text1: 'Interactive Exams',
//       text2: "By boosting your productivity we help\n you achieve your purpose",
//       buttonText: 'Get Started',
//     ),
//   ];

//   void _nextPage() {
//     if (_currentPage < _pages.length - 1) {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       // Navigate to login screen
//       Navigator.pushReplacementNamed(context, '/login');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: _pages.length,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   final page = _pages[index];
//                   return SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 40),
//                           Image.asset(page.image),
//                           if (page.text1.isNotEmpty) ...[
//                             const SizedBox(height: 20),
//                             Text(
//                               page.text1,
//                               textAlign: TextAlign.center,
//                               style: kGilroy28700,
//                             ),
//                           ],
//                           if (page.text2.isNotEmpty) ...[
//                             const SizedBox(height: 10),
//                             Text(
//                               page.text2,
//                               textAlign: TextAlign.center,
//                               style: kGilroy16500,
//                             ),
//                           ],
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: FractionallySizedBox(
//                 widthFactor: 0.85,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: _nextPage,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         _pages[_currentPage].buttonText,
//                         style: const TextStyle(
//                           fontFamily: 'Gilroy',
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromRGBO(255, 255, 255, 1),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Icon(
//                         Icons.navigate_next,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Page indicator
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 _pages.length,
//                 (index) => Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   width: 8,
//                   height: 8,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: _currentPage == index
//                         ? const Color.fromRGBO(61, 123, 66, 1)
//                         : Colors.grey.shade300,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OnboardingPage {
//   final String image;
//   final String text1;
//   final String text2;
//   final String buttonText;

//   OnboardingPage({
//     required this.image,
//     this.text1 = '',
//     this.text2 = '',
//     required this.buttonText,
//   });
// }

import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';
import 'package:gyaanplant_learning_app/views/login/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/onboard/GyaanPlant_Latest_Logo_1.png',
      buttonText: "Let's Get Started",
      isFirstScreen: true,
    ),
    OnboardingPage(
      image: 'assets/images/onboard/Video-Stream.png',
      text1: 'Welcome to Gyaan Plant',
      text2:
          "Start your learning journey with\nour comprehensive video courses\nand interactive exams",
      buttonText: 'Next',
    ),
    // Add other pages here
    OnboardingPage(
      image: 'assets/images/onboard/image2360.png',
      text1: 'Collaborate Seamlessly',
      text2: "Collaborate Seamlessly \n without any interruption",
      buttonText: 'Next',
    ),
    OnboardingPage(
      image: 'assets/images/onboard/image2361.png',
      text1: 'Interactive Exams',
      text2: "By boosting your productivity we help\n you achieve your purpose",
      buttonText: 'Login',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to login screen
      // Navigator.pushReplacementNamed(context, '/login');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                // PageView section with fixed height
                SizedBox(
                  height:
                      constraints.maxHeight - 150, // Reserve space for button
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final page = _pages[index];
                      return _buildPageContent(page, constraints);
                    },
                  ),
                ),

                // Button and indicator section
                _buildBottomSection(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageContent(OnboardingPage page, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight - 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Special spacing for first screen
            if (page.isFirstScreen) const SizedBox(height: 20),

            // Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Center(
                child: Image.asset(
                  page.image,
                  height: page.isFirstScreen
                      ? null // Natural height for logo
                      : constraints.maxHeight * 0.4,
                ),
              ),
            ),

            // Text content
            if (page.text1.isNotEmpty) ...[
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  page.text1,
                  textAlign: TextAlign.center,
                  style: kGilroy28700,
                ),
              ),
            ],
            if (page.text2.isNotEmpty) ...[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  page.text2,
                  textAlign: TextAlign.center,
                  style: kGilroy16500,
                ),
              ),
            ],

            // Spacer for non-first screens
            if (!page.isFirstScreen)
              SizedBox(height: constraints.maxHeight * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        children: [
          // 20px space between content and button for non-first screens
          // if (!_pages[_currentPage].isFirstScreen) const SizedBox(height: 0),

          // Button
          FractionallySizedBox(
            widthFactor: 0.85,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _nextPage,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _pages[_currentPage].buttonText,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String image;
  final String text1;
  final String text2;
  final String buttonText;
  final bool isFirstScreen;

  OnboardingPage({
    required this.image,
    this.text1 = '',
    this.text2 = '',
    required this.buttonText,
    this.isFirstScreen = false,
  });
}
