import 'dart:convert';
import 'package:http/http.dart' as http;
import 'index.dart';

class AuthServices {
  final String baseUrl = '${DemoData.baseUrl}/auth';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: DemoData.defaultHeaders,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: DemoData.defaultHeaders,
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> sendOtp(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/send-otp'),
      headers: DemoData.defaultHeaders,
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    return jsonDecode(response.body);
  }
}
