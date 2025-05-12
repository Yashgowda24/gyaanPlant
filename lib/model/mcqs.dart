class Mcq {
  bool success;
  String message;
  int statusCode;
  List<Assessment> data;

  Mcq({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Mcq.fromJson(Map<String, dynamic> json) {
    return Mcq(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: (json['data'] as List)
          .map((item) => Assessment.fromJson(item))
          .toList(),
    );
  }
}

class Assessment {
  String id;
  String title;
  List<Question> questions;

  Assessment({
    required this.id,
    required this.title,
    required this.questions,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      id: json['_id'],
      title: json['title'],
      questions: (json['questions'] as List)
          .map((item) => Question.fromJson(item))
          .toList(),
    );
  }
}

// class Course {
//   String id;

//   Course({
//     required this.id,
//   });

//   factory Course.fromJson(Map<String, dynamic> json) {
//     return Course(
//       id: json['_id'],
//     );
//   }
// }

class Question {
  String question;
  List<String> options;
  String correctAnswer;
  int marks;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.marks,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
      marks: json['marks'],
    );
  }
}
