import 'package:dio/dio.dart';
import 'package:eltracmo_staff/models/user.dart';
import 'package:eltracmo_staff/services/common/api_service.dart';
import 'package:eltracmo_staff/services/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerService {
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static Future<Map<String, dynamic>> getCustomerProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var data = await ApiService.getRequest(profileGetRoute, headers: headers);

    if (data == null) {
      return {};
    }

    return data;
  }

  static Future<bool> updateCustomerProfile(FormData formData) async {
    // get token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var url = profileUpdateRoute;

    var data = await ApiService.uploadFile(url, formData, headers);

    if (data == null) return false;

    if (data.containsKey('status') && data['status'] == 'success') {
      return true;
    }

    return false;
  }

  static Future<User?> getLoggedInCustomerUser() async {
    // get token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var data = await ApiService.getRequest(profileGetRoute, headers: headers);

    if (data!.isNotEmpty) {
      return User.fromJson(data);
    }

    return null;
  }
}
