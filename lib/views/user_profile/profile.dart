import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/shared_preferences/user_shared_preferences.dart';
import 'package:gyaanplant_learning_app/views/settings/setting_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool showBadges = true;
  String? _userName;
  String? _userEmail;
  String? _userPhoto;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final name = await UserPreferences.getUserName();
    final email = await UserPreferences.getUserEmail();
    final userPhoto = await UserPreferences.getUserProfilePhoto();
    print(name);
    print(email);
    print(userPhoto);
    setState(() {
      _userName = name;
      _userEmail = email;
      _userPhoto = userPhoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0,
              offset: Offset(0, 0),
              color: Color.fromRGBO(179, 32, 115, 0.18),
            )
          ]),
          child: AppBar(
            title: const Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              // User Info Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 40,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundImage: _userPhoto != null &&
                              _userPhoto!.isNotEmpty
                          ? NetworkImage(_userPhoto!)
                          : const AssetImage('assets/images/leaderboard/8.png')
                              as ImageProvider,
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userName ?? '',
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 20.0,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _userEmail ?? '',
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14.0,
                            color: Color.fromRGBO(24, 27, 25, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Level and XP
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(135, 181, 139, 0.3),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Level 5",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'EXP ',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(34, 197, 94, 1),
                                  ),
                                ),
                                TextSpan(
                                  text: '150 / 5000',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(38, 50, 58, 1),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const LinearProgressIndicator(
                          value: 150 / 5000,
                          backgroundColor: Color(0xFFEDEDED),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Stats Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildStatBox(
                        icon: Image.asset('assets/images/home/Fire.png'),
                        value: '3',
                        label: 'Courses Completed'),
                    const SizedBox(width: 12),
                    _buildStatBox(
                        icon: Image.asset('assets/images/home/Coins.png'),
                        value: '33',
                        label: 'Points'),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Tabs: Badges | Stats
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           GestureDetector(
              //             onTap: () => setState(() => showBadges = true),
              //             child: Column(
              //               children: [
              //                 const Text(
              //                   "Badges",
              //                   style: TextStyle(
              //                     fontFamily: 'Gilroy',
              //                     fontSize: 18.0,
              //                     color: Color.fromRGBO(0, 0, 0, 1),
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //                 const SizedBox(height: 4),
              //                 if (showBadges)
              //                   Container(
              //                     height: 2,
              //                     width: 60,
              //                     color: Colors.green,
              //                   )
              //               ],
              //             ),
              //           ),
              //           const SizedBox(width: 20),
              //           GestureDetector(
              //             onTap: () => setState(() => showBadges = false),
              //             child: Column(
              //               children: [
              //                 const Text(
              //                   "Stats",
              //                   style: TextStyle(
              //                     fontFamily: 'Gilroy',
              //                     fontSize: 18.0,
              //                     color: Color.fromRGBO(0, 0, 0, 1),
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //                 const SizedBox(height: 4),
              //                 if (!showBadges)
              //                   Container(
              //                     height: 2,
              //                     width: 60,
              //                     color: Colors.green,
              //                   )
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       Divider(),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => showBadges = true),
                          child: Column(
                            children: [
                              Text(
                                "Badges",
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: showBadges
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () => setState(() => showBadges = false),
                          child: Column(
                            children: [
                              Text(
                                "Stats",
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: !showBadges
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Divider + indicator
                    Stack(
                      children: [
                        // Base grey divider
                        Container(
                          height: 2,
                          color: const Color.fromRGBO(230, 230, 230, 1),
                        ),

                        // Animated green line indicator (half width)
                        Align(
                          alignment: showBadges
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            height: 2,
                            width: MediaQuery.of(context).size.width / 2 -
                                32, // Subtract padding
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tab content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: showBadges ? _buildBadgesGrid() : _buildStatsContent(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(
      {required Image icon, required String value, required String label}) {
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, left: 14, right: 14, bottom: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(135, 181, 139, 0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.readexPro(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(38, 50, 58, 1),
                  ),
                ),
                const SizedBox(height: 2),
                Text(label,
                    style: GoogleFonts.readexPro(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(38, 50, 58, 1),
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesGrid() {
    final List<String> badgePaths = [
      'assets/images/leaderboard/6.png',
      'assets/images/leaderboard/7.png',
      'assets/images/leaderboard/8.png',
      'assets/images/leaderboard/5.png',
      'assets/images/leaderboard/4.png',
      'assets/images/leaderboard/3.png',
    ];

    return GridView.builder(
      itemCount: badgePaths.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
      itemBuilder: (context, index) {
        return Image.asset(badgePaths[index]);
      },
    );
  }

  Widget _buildStatsContent() {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(214, 250, 221, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Column(
        children: [
          RichText(
            text: TextSpan(
                style: GoogleFonts.rubik(
                  fontSize: 20.0,
                  color: Color.fromRGBO(12, 9, 42, 1),
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(text: 'You have played a total\n'),
                  TextSpan(
                    text: '24 quizzes',
                    style: TextStyle(
                      color: Color.fromRGBO(61, 123, 68, 1),
                    ),
                  ),
                  TextSpan(text: ' this month!'),
                ]),
          ),
          SizedBox(
            height: 25,
          ),
          Image.asset('assets/images/leaderboard/O.png'),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '5',
                            style: GoogleFonts.rubik(
                              fontSize: 32.0,
                              color: Color.fromRGBO(12, 9, 42, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Image.asset('assets/images/home/pen.png'),
                        ],
                      ),
                      Text(
                        'Courses Completed',
                        style: GoogleFonts.rubik(
                          fontSize: 14.0,
                          color: Color.fromRGBO(12, 9, 42, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(61, 123, 68, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '21',
                            style: GoogleFonts.rubik(
                              fontSize: 32.0,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Image.asset('assets/images/home/badge.png'),
                        ],
                      ),
                      Text(
                        'Quiz won',
                        style: GoogleFonts.rubik(
                          fontSize: 14.0,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
