import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_endpoints.dart';

class AuthApi {

  /// LOGIN
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.login),
      headers: _headers,
      body: jsonEncode({"email": email, "password": password}),
    );
    return _handleResponse(response);
  }

  /// SIGNUP
  static Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.signup),
      headers: _headers,
      body: jsonEncode({
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      }),
    );
    return _handleResponse(response);
  }

  /// VERIFY OTP
  static Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await http.post(
      Uri.parse(ApiEndpoints.verifyOtp),
      headers: _headers,
      body: jsonEncode({"email": email, "otp": otp}),
    );
    return _handleResponse(response);
  }

  static const Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static Map<String, dynamic> _handleResponse(http.Response response) {
    return {
      "statusCode": response.statusCode,
      "body": jsonDecode(response.body),
    };
  }
}
