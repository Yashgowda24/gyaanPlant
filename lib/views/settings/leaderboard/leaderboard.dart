import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                spreadRadius: 0,
                offset: Offset(0, 0),
                color: Color.fromRGBO(179, 32, 115, 0.18),
              )
            ],
          ),
          child: AppBar(
            title: const Text(
              'Leaderboard',
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
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          const SizedBox(height: 30),

          // Top 3 users
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTopUser('assets/images/leaderboard/Ellipse55.png',
                  'Meghan Jes...', 40, 2),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildAvatar('assets/images/leaderboard/Ellipse55.png',
                          60, Colors.green),
                      const SizedBox(height: 5),
                      const Text(
                        'Marsha Fisher',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      const Text('🥇 43 pts'),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      'assets/images/leaderboard/crown1.png', // Crown image
                      height: 30,
                    ),
                  ),
                ],
              ),
              _buildTopUser('assets/images/leaderboard/Ellipse55.png',
                  'Alex Turner', 38, 3),
            ],
          ),

          const SizedBox(height: 20),

          // Remaining users list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildUserTile(4, 'Becky Bartell', 36,
                    'assets/images/leaderboard/Ellipse55.png'),
                _buildUserTile(5, 'Marsha Fisher', 36,
                    'assets/images/leaderboard/Ellipse55.png'),
                _buildUserTile(
                    6, 'You', 33, 'assets/images/leaderboard/Ellipse55.png',
                    isYou: true),
                _buildUserTile(7, 'Tamara Schmidt', 32,
                    'assets/images/leaderboard/Ellipse55.png'),
                _buildUserTile(8, 'Marsha Fisher', 31,
                    'assets/images/leaderboard/Ellipse55.png'),
                _buildUserTile(9, 'Ricardo Veum', 28,
                    'assets/images/leaderboard/Ellipse55.png'),
                _buildUserTile(10, 'Alex Kia', 28,
                    'assets/images/leaderboard/Ellipse55.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopUser(String imagePath, String name, int points, int rank) {
    return Column(
      children: [
        _buildAvatar(imagePath, 50, Colors.green),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text('🥈 $points pts'), // 🥈 or 🥉 or custom coin icon
      ],
    );
  }

  Widget _buildAvatar(String path, double size, Color borderColor) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: CircleAvatar(
        radius: size / 2,
        backgroundImage: AssetImage(path),
      ),
    );
  }

  Widget _buildUserTile(int rank, String name, int points, String imgPath,
      {bool isYou = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isYou ? const Color(0xFF206A4F) : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            '$rank',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isYou ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(imgPath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: isYou ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '$points pts',
            style: TextStyle(
              color: isYou ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
