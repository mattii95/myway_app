import 'package:flutter_dotenv/flutter_dotenv.dart';
class ApiConfig {
  static String apiHost = dotenv.get('API_HOST');
}