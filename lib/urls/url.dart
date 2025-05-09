import 'dart:convert';
import 'dart:io';

import 'package:gyaanplant_learning_app/model/get_category.dart';
import 'package:gyaanplant_learning_app/model/get_course.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      final success = responseData['success'] == true;
      final userId = responseData['data']['_id'];
      final userName = responseData['data']['name'];
      final profilePic = responseData['data']['profile_pic'];
      final userEmail = responseData['data']['email'];

      // Shared Preferences:
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userId);
      await prefs.setString('userName', userName);
      await prefs.setString('userEmail', userEmail);
      await prefs.setString('userProfilePic', profilePic);

      print('User ID from api call: $userId');
      print('User name from api call: $userName');
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

  // Users My Profile page, image update api call
  static Future<String> uploadImage(File imageFile) async {
    final uri = Uri.parse('$baseUrl/file/upload');

    var request = http.MultipartRequest('POST', uri);
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    final response = await request.send();
    print('File upload response: $response');

    if (response.statusCode == 200) {
      print('fileUpload stat code is 200');
      final respStr = await response.stream.bytesToString();
      final jsonResp = json.decode(respStr);
      print('file path is:');
      print(jsonResp['file']['filePath']);
      return jsonResp['file']['filePath'];
    } else {
      print('file upload failed!');
      print('${response.statusCode}');
      return '';
    }
  }

  // Update user profile
//   2. profileUpdate - baseurl + user/update-profile/${userId} method: PUT, Body :
// {
//     "name":"John Kevin",
//     "email":"johnkevin@gmail.com",
//     "phone_number":"9937363686",
//     "profile_pic":"https://example.png"
// } sample body data

  static Future<void> updateUserProfile({
    required String name,
    required String email,
    required String phone,
    required String profilePic,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    print('UserID for api is: $userId');
    if (userId == null) return;

    final uri = Uri.parse('$baseUrl/user/update-profile/$userId');
    final response = await http.put(uri,
        headers: {'content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "email": email,
          "phone_number": phone,
          "profile_pic": profilePic,
        }));

    print('api response is: $response');

    if (response.statusCode == 200) {
      print('Profile updated');
    } else {
      print('Prof update failed: ${response.body}');
    }
  }

  static Future<List<GetAssessmentCategory>> getAssessmentCategory() async {
    final uri = Uri.parse('$baseUrl/category/get-category');

    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      List jsonDataList = jsondata['data'];
      print(
          jsonDataList.map((e) => GetAssessmentCategory.fromJson(e)).toList());
      return jsonDataList
          .map((e) => GetAssessmentCategory.fromJson(e))
          .toList();
    } else {
      print('api call failed!');
      throw Exception('Api fail');
    }
  }
}
