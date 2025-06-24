import 'dart:convert';

import 'package:myway_app/src/data/api/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:myway_app/src/domain/models/auth_response.dart';
import 'package:myway_app/src/domain/models/user.dart';
import 'package:myway_app/src/domain/utils/listo_to_string.dart';
import 'package:myway_app/src/domain/utils/resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.apiHost, '/api/auth/login');
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
  
  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.apiHost, '/api/auth/register');
      Map<String, String> headers = {'Content-Type': 'application/json'};

      String body = json.encode({
        'name' : user.name,
        'surname' : user.surname,
        'phone' : user.phone,
        'email' : user.email,
        'password' : user.password,
        'rolesTypes' : user.rolesTypes,
      });

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
