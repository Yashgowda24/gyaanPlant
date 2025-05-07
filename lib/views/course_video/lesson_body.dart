import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyaanplant_learning_app/providers/course_provider.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';
import 'package:gyaanplant_learning_app/views/assessmet/assessmet.dart';
import 'package:gyaanplant_learning_app/views/course_video/course_completed.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class LessonBody extends StatefulWidget {
  const LessonBody({super.key});

  @override
  State<LessonBody> createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {
  // void goToLesson(int lessonNum) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => LessonBody(lessonNumber: lessonNum),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

    if (courseProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final courses = courseProvider.courses;

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
            centerTitle: true,
            title: const Text(
              'Introduction',
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
      body: LessonBodyWidget(
        lessonTitle: courses[0].lessons[0].title,
        lessonDescription: courses[0].lessons[0].description,
        lessonVideoUrl: courses[0].lessons[0].videoUrl,
      ),
    );
  }
}

class LessonBodyWidget extends StatefulWidget {
  final String lessonVideoUrl;
  final String lessonTitle;
  final String lessonDescription;

  LessonBodyWidget({
    required this.lessonTitle,
    required this.lessonDescription,
    required this.lessonVideoUrl,
  });

  @override
  State<LessonBodyWidget> createState() => _LessonBodyWidgetState();
}

class _LessonBodyWidgetState extends State<LessonBodyWidget> {
  late final int lessonNumber;
  bool isFirstlesson = true;
  bool isLastLesson = false;

  void _showCourseCompletedPopup() {
    showDialog(
      context: context,
      builder: (_) => CustomPopup(
        imageAsset: 'assets/images/home/course_completed.png',
        title: 'Course Completed',
        subtitle:
            'You have successfully completed your Web Development Course by GyaanPlant',
        buttonText: 'Continue',
        onButtonPressed: () {
          Navigator.of(context).pop();
          _showAchievementPopup();
        },
      ),
    );
  }

  void _showAchievementPopup() {
    showDialog(
      context: context,
      builder: (_) => CustomPopup(
        imageAsset: 'assets/images/home/5.png',
        title: 'Achievement Accomplished!',
        subtitle: 'NEW BADGE! Course Completed!',
        buttonText: 'Share',
        onButtonPressed: () {
          Navigator.of(context).pop();
          // You can implement share logic or navigation here
        },
        bottomWidget: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.monetization_on, color: Colors.amber),
            SizedBox(width: 4),
            Text('+25  ', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 50),
            Text('EXP',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
            SizedBox(width: 4),
            Text('+150', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        titleStyle: GoogleFonts.jost(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(32, 34, 68, 1),
        ),
        subtitleStyle: GoogleFonts.mulish(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        backgroundColor: const Color.fromRGBO(84, 84, 84, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        NetworkVideoPlayer(videoUrl: widget.lessonVideoUrl),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.lessonTitle,
            style: kHomeSubHeadingStyle,
          ),
        ),
        const SizedBox(height: 6),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Gyaan Plant',
            style: kGyaanPlantText,
          ),
        ),
        const SizedBox(height: 16),
        Divider(),
        const SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.lessonDescription,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 16.0,
              color: Color.fromRGBO(91, 91, 91, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.90,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssessmetScreen(),
                  ),
                );
              },
              child: Text(
                'Assessment',
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBackgroundColor: Colors.grey[300],
                    ),
                    child: const Text(
                      'Previous',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: ElevatedButton(
                    onPressed: _showCourseCompletedPopup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBackgroundColor: Colors.grey[300],
                    ),
                    child: const Text(
                      'Next Chapter',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NetworkVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const NetworkVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(_controller),
                if (!_controller.value.isPlaying)
                  IconButton(
                    icon: const Icon(Icons.play_circle,
                        size: 64, color: Colors.white),
                    onPressed: () => _controller.play(),
                  ),
                Positioned(
                  bottom: 10,
                  left: 16,
                  right: 16,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.red,
                      bufferedColor: Colors.white54,
                      backgroundColor: Colors.white30,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
