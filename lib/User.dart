import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class User {
  int id;
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;

  // ignore: non_constant_identifier_names
  User({this.id, this.first_name, this.last_name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["data"]["id"],
        first_name: json["data"]["first_name"],
        last_name: json["data"]["last_name"]);
  }

  static Future<User> fetchUser(id) async {
    final url = Uri.parse("https://reqres.in/api/users/" + id);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<dynamic>> fetchDataUsers() async {
    final url = Uri.parse("https://reqres.in/api/users");
    var result = await http.get(url);
    return json.decode(result.body)['data'];
  }
}
