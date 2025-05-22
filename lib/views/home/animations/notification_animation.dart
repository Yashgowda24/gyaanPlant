import 'package:flutter/material.dart';

class AnimatedNotificationIcon extends StatefulWidget {
  const AnimatedNotificationIcon({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<AnimatedNotificationIcon> createState() =>
      _AnimatedNotificationIconState();
}

class _AnimatedNotificationIconState extends State<AnimatedNotificationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.8,
      upperBound: 1.0,
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Optionally loop or just animate on tap
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animate();
        widget.onPressed();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child:
            const Icon(Icons.notifications_none_rounded, color: Colors.black),
      ),
    );
  }
}
