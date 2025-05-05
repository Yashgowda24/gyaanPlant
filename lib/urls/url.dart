import 'dart:convert';

import 'package:http/http.dart' as http;

class AppUrl {
  static String baseUrl = "https://gyannplant-backend.onrender.com/api";

  static Future<void> sendOtp(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/send-otp'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'phoneNumber': phoneNumber}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Otp sent');
      print('Response code: ${response.statusCode}');
      print('Otp response body:${response.body}');
    } else {
      print('Failed: ${response.body}');
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
}
