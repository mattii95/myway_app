import 'package:myway_app/src/domain/models/AuthResponse.dart';
import 'package:myway_app/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password); 
}