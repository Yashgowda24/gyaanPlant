class GetAssessmentCategory {
  String? title;
  String? imageUrl;

  GetAssessmentCategory({
    required this.title,
    required this.imageUrl,
  });

  factory GetAssessmentCategory.fromJson(Map<String, dynamic> json) =>
      GetAssessmentCategory(
        title: json['title'],
        imageUrl: json['image_url'],
      );
}
