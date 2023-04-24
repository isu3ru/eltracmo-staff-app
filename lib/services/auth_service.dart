import 'package:eltracmo_staff/services/common/api_service.dart';
import 'package:eltracmo_staff/services/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static Future<bool> attemptLogin(username, password) async {
    final requestData = {
      'mobile_number': username,
      'password': password,
    };
    final response =
        await ApiService.postRequest(loginRoute, requestData, headers);
    if (response != null && response.containsKey('token')) {
      // save the token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response['token']);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> attemptRegistration(data) async {
    final response = await ApiService.postRequest(registerRoute, data, headers);
    if (response == null) {
      return false;
    }
    if (response.containsKey('status') && response['status'] == 'success') {
      return true;
    }
    return false;
  }
}
