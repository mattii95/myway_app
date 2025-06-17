import 'dart:convert';

import 'package:myway_app/src/data/api/ApiConfig.dart';
import 'package:http/http.dart' as http;
import 'package:myway_app/src/domain/models/AuthResponse.dart';
import 'package:myway_app/src/domain/utils/ListToString.dart';
import 'package:myway_app/src/domain/utils/Resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_HOST, '/api/auth/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};

      String body = json.encode({'email': email, 'password': password});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode != 200 && response.statusCode != 201) {
        return ErrorData(listToString(data['message']));
      }

      final authResponse = AuthResponse.fromJson(data);

      return Success(authResponse);
    } catch (e) {
      return ErrorData(e.toString());
    }
  }
}
