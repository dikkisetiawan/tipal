import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  Future<bool> login(
      {required String username, required String password}) async {
    final response = await http.get(Uri.parse(
        'https://tipal.my.id/auth/login.php?username=$username&password=$password'));

    var decodedResponse = jsonDecode(response.body)['status'];

    print('logme $decodedResponse');

    if (decodedResponse == true) {
      return true;
    } else {
      throw Exception('Failed to login');
    }
  }
}
