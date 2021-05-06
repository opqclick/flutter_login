import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String mobile, String password) async {
  try {
    String apiUrl = 'http://127.0.0.1:8000/api/login';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Accept": "Application/json"},
      body: {'email': mobile, 'password': password},
    );
    var data = jsonDecode(response.body);
    return data;
  } catch (e) {
    print("Custom error message: $e");
  }
}
