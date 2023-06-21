import '../utils/config.dart';
import 'local_storage.dart';

class ApiHelper {
  static url(String endpoint) {
    return Uri.parse('${ApiConfig.baseUrl}$endpoint');
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${LocalStorage.getToken()}'
  };
}
