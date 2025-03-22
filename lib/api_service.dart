import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/user.dart';
import 'models/plants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "http://158.160.47.233:8080/v1/user";

  static Future<List<Plant>> getPlants() async {
    final cookie = await SharedPreferences.getInstance().then(
      (prefs) => prefs.getString('auth_cookie'),
    );

    String cookieData = cookie!.split('=')[1].split(';')[0];

    print('Authorization: $cookieData'); // Логирование куки

    final response = await http.get(
      Uri.parse('$baseUrl/plants'),
      headers: {'Cookie': cookie ?? ''},
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);

      if (data == null) {
        return [];
      }

      if (data is List) {
        return data.map((json) => Plant.fromJson(json)).toList();
      } else {
        throw Exception('Ожидался список, но получен другой тип данных');
      }
    } else {
      throw Exception('Failed to load plants: ${response.statusCode}');
    }
  }

  // Для сохранения куки
  static Future<void> _saveCookie(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_cookie', cookie);
  }

  // Для получения куки
  static Future<String?> _getCookie() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_cookie');
  }

  // Для удаления куки
  static Future<void> _deleteCookie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_cookie');
  }

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

    if (response.statusCode == 200) {
      final rawCookie = response.headers['set-cookie'];
      if (rawCookie != null) {
        await _saveCookie(rawCookie.split(';')[0]);
      }
    } else {
      throw Exception('Неверные учетные данные');
    }
  }

  static Future<void> logout() async {
    final cookie = await _getCookie();

    await http.get(
      Uri.parse('$baseUrl/logout'),
      headers: {'Cookie': cookie ?? ''},
    );

    await _deleteCookie();
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
