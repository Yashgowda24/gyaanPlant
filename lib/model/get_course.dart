class GetCourse {
  final String title;
  final String thumbnail;
  final String description;
  final List<Lesson> lessons;

  GetCourse({
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.lessons,
  });

  factory GetCourse.fromJson(Map<String, dynamic> json) => GetCourse(
        title: json['title'],
        thumbnail: json['thumbnail'],
        description: json['description'],
        lessons: List.from(json['lessons'].map((x) => Lesson.fromJson(x))),
      );
}

class Lesson {
  String title;
  String videoUrl;
  String description;

  Lesson({
    required this.title,
    required this.videoUrl,
    required this.description,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
      title: json['title'],
      videoUrl: json['videoUrl'],
      description: json['description']);
}
