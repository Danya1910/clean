import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const _baseUrl = 'http://localhost:8080';
  
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      await _saveToken(token);
      return true;
    }
    return false;
  }
  
  Future<void> _saveToken(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'auth_token', value: token);
  }
  
  Future<bool> isLoggedIn() async {
    final storage = FlutterSecureStorage();
    return await storage.containsKey(key: 'auth_token');
  }
  
  Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'auth_token');
  }
}