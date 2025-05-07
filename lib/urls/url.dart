import 'dart:convert';

import 'package:gyaanplant_learning_app/model/get_course.dart';
import 'package:http/http.dart' as http;

class AppUrl {
  static String baseUrl = "https://gyannplant-backend.onrender.com/api";

  static Future<bool> sendOtp(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/send-otp'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'phoneNumber': phoneNumber}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final success = responseData['success'] = true;
      print('Otp sent');
      print('Response code: ${response.statusCode}');
      print('Otp response body:${response.body}');
      return success;
    } else {
      print('Failed: ${response.body}');
      return false;
    }
  }

  static Future<bool> verifyOtp(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/verify-otp'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phoneNumber': phoneNumber,
        'otp': otp,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final success = responseData['success'] = true;
      print('Otp verified');
      print('Response code: ${response.statusCode}');
      print('Otp response body:${response.body}');
      return success;
    } else {
      print('Failed: ${response.body}');
      return false;
    }
  }

  static Future<List<GetCourse>> getCourse() async {
    final response = await http.get(Uri.parse('$baseUrl/course/get-course'));
    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = jsonDecode(response.body);
      final List courseJson = jsonData['data'];
      print(courseJson
          .map((courseJson) => GetCourse.fromJson(courseJson))
          .toList()
          .cast<GetCourse>());
      return courseJson
          .map((courseJson) => GetCourse.fromJson(courseJson))
          .toList()
          .cast<GetCourse>();
    } else {
      print('Get course api failed: ${response.statusCode}');
      throw Exception('Failed to load courses');
    }
  }
}
