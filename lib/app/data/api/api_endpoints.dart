class ApiEndpoints {
  static const bool isProd = false;

  static const String _devBaseUrl =
      "http://192.168.10.149:8080/api/auth/user";

  static const String _prodBaseUrl =
      "https://yourdomain.com/api/auth/user";

  static String get baseUrl => isProd ? _prodBaseUrl : _devBaseUrl;

  /// AUTH
  static String get login => "$baseUrl/login";
  static String get signup => "$baseUrl/signup";
  static String get verifyOtp => "$baseUrl/otp/verify";
}
