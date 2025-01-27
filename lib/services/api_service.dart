import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rainbow_reach/models/user_model.dart';

class ApiService {
  final String baseUrl = 'https://mockapi.io'; // Replace with your mock API URL

  // Fetch user details
  Future<User> fetchUser(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
