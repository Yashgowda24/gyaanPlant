import 'dart:convert';
import 'dart:io';

import 'package:gyaanplant_learning_app/model/get_category.dart';
import 'package:gyaanplant_learning_app/model/get_course.dart';
import 'package:gyaanplant_learning_app/model/mcqs.dart';
import 'package:gyaanplant_learning_app/shared_preferences/user_shared_preferences.dart';
import 'package:http/http.dart' as http;

class AppUrl {
  static String baseUrl = "https://gyannplant-backend.onrender.com/api";
  static const String sendOtpUrl = 'auth/send-otp';
  static const String verifyOtpUrl = 'auth/verify-otp';
  static const String getCourseUrl = 'course/get-course';
  static const String fileUploadUrl = 'file/upload';
  // add userId at last for updateProfileUrl
  static const String updateProfileUrl = 'user/update-profile';
  static const String getCategoryUrl = 'category/get-category';
  static const String getAssessmentQuestionUrl = 'assessment/get-questions';

  //  api call to send otp
  static Future<bool> sendOtp(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$sendOtpUrl'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final success = responseData['success'] == true;
        print('Otp sent');
        print('Otp response body:${response.body}');
        return success;
      } else {
        print('Failed: ${response.body}');
        return false;
      }
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }

  // api call to verify otp
  static Future<bool> verifyOtp(String phoneNumber, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$verifyOtpUrl'),
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

        await UserPreferences.saveUserDetails(
          userId: userId,
          userName: userName,
          userEmail: userEmail,
          userProfilePic: profilePic,
        );

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
    } catch (e) {
      throw Exception('Error verifying OTP: $e');
    }
  }

  // gets course for home screen
  static Future<List<GetCourse>> getCourse() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$getCourseUrl'));
      print(response.body);
      if (response.statusCode == 200) {
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
    } catch (e) {
      throw Exception('Error getting course: $e');
    }
  }

  // Users My Profile page, image update api call
  static Future<String> uploadImage(File imageFile) async {
    try {
      final uri = Uri.parse('$baseUrl/$fileUploadUrl');

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
    } catch (e) {
      throw Exception('Upload failed: $e');
    }
  }

  // Update users profile api with name, email, profile pic
  static Future<void> updateUserProfile({
    required String name,
    required String email,
    required String phone,
    required String profilePic,
  }) async {
    String? userId = await UserPreferences.getUserId();
    print('UserID for api is: $userId');
    if (userId == null) return;

    final uri = Uri.parse('$baseUrl/$updateProfileUrl/$userId');
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
    try {
      final uri = Uri.parse('$baseUrl/$getCategoryUrl');

      final response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        List jsonDataList = jsondata['data'];
        print(jsonDataList
            .map((e) => GetAssessmentCategory.fromJson(e))
            .toList());
        return jsonDataList
            .map((e) => GetAssessmentCategory.fromJson(e))
            .toList();
      } else {
        print('api call failed!');
        throw Exception('Api fail');
      }
    } catch (e) {
      throw Exception('Fetching catergory failed: $e');
    }
  }

  static Future<Mcq> getAssessmentMCQ() async {
    final response =
        await http.get(Uri.parse('$baseUrl/$getAssessmentQuestionUrl'));
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(Mcq.fromJson(jsonData));
      return Mcq.fromJson(jsonData);
    } else {
      print('Error');
      throw Exception('api call failed');
    }
  }
}
