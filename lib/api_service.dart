import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/user.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8080/v1/user";

  static Future<User> getUser() async {
    final response = await http.get(Uri.parse('$baseUrl/'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }

  static Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user data');
    }
  }

  static Future<void> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create user');
    }
  }

  static Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }
  }

  static Future<void> logout() async {
    final response = await http.get(Uri.parse('$baseUrl/logout'));

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
  }

  static Future<User> getUserById(String uid) async {
    final response = await http.get(Uri.parse('$baseUrl/$uid'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }

  static Future<void> deleteUser(String uid) async {
    final response = await http.delete(Uri.parse('$baseUrl/$uid'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
