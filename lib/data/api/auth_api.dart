import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc_app_template/constants/url.dart';
import 'package:flutter_bloc_app_template/models/user.dart';
import 'package:http/http.dart' as http;

final _tokenEndpoint = '/api/auth/login';
final _tokenURL = Uri.https(baseUrl , _tokenEndpoint);

abstract class AuthenticationApi {
  Future<String> getToken(String u, String p);
}

Future<User> getToken(String u, String p) async {
  print(_tokenURL);
  var response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'email': u, 'password': p}),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    var res = json.decode(response.body);
    print(res);
    return User(id: 
      res['id'].toString(), 
      fullname: res['fullname'].toString(),
      email: res['email'].toString(), 
      accessToken: res['access_token'].toString(), 
      photo: 
      res['avatar']!=null? res['avatar'].toString():'');
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}