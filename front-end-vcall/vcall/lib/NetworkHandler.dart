import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHaundler {
  String BaseURL = "http://localhost:3000";

  Future<dynamic> SimplePost(String url, Map<String, String> body) async {
    var res = await http.post(Uri.parse("${BaseURL}${url}"),
        headers: {'Context-Type': 'application/json;charSet=UTF-8'},
        body: body);
    return res;
  }
}
