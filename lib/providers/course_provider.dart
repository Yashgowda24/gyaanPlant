import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/model/get_course.dart';
import 'package:gyaanplant_learning_app/urls/url.dart';

class CourseProvider extends ChangeNotifier {
  List<GetCourse> _courses = [];
  bool _isLoading = true;

  List<GetCourse> get courses => _courses;
  bool get isLoading => _isLoading;

  Future<void> fetchCourses() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await AppUrl.getCourse();
      _courses = data;
    } catch (e) {
      print('Failed to load courses!: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
