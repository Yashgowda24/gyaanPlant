import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/views/settings/setting_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool showBadges = true;

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
      // backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundImage:
                          AssetImage('assets/images/home/Avatar.png'),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Kevin',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 20.0,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'johnkevin@gmail.com',
                          style: TextStyle(
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
                        children: const [
                          Text("Level 5",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text(
                            "EXP 150 / 5000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
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
                        icon: Icons.local_fire_department,
                        value: '3',
                        label: 'Courses Completed'),
                    const SizedBox(width: 12),
                    _buildStatBox(
                        icon: Icons.monetization_on,
                        value: '33',
                        label: 'Points'),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Tabs: Badges | Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => showBadges = true),
                      child: Column(
                        children: [
                          const Text(
                            "Badges",
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 18.0,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (showBadges)
                            Container(
                              height: 2,
                              width: 60,
                              color: Colors.green,
                            )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => setState(() => showBadges = false),
                      child: Column(
                        children: [
                          const Text(
                            "Stats",
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 18.0,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (!showBadges)
                            Container(
                              height: 2,
                              width: 60,
                              color: Colors.green,
                            )
                        ],
                      ),
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
      {required IconData icon, required String value, required String label}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F0E9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.deepOrange),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(label,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
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
      padding: const EdgeInsets.all(24),
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
                            style: TextStyle(color: Colors.black, fontSize: 32),
                          ),
                          Icon(CupertinoIcons.pencil),
                        ],
                      ),
                      Text('Courses Completed'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
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
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                          Icon(
                            CupertinoIcons.play_rectangle,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        'Quiz won',
                        style: TextStyle(color: Colors.white),
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
