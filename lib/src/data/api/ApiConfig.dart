import 'package:flutter_dotenv/flutter_dotenv.dart';
class ApiConfig {
  static String API_HOST = dotenv.get('API_HOST');
}