import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  static Future<bool> login(
      {required String username, required String password}) async {
    final response = await http.get(Uri.parse(
        'https://tipal.my.id/auth/login.php?username=$username&password=$password'));

    var decodedResponse = jsonDecode(response.body)['status'];

    if (decodedResponse == true) {
      return true;
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<bool> register(
      {required String username, required String password}) async {
    var body = {'username': username, 'password': password};

    final response = await http
        .post(Uri.parse('https://tipal.my.id/auth/signup.php'), body: body);

    var decodedResponse = jsonDecode(response.body)['status'];

    if (decodedResponse == true) {
      return true;
    } else {
      throw Exception('Failed to register');
    }
  }
}
