import 'package:eltracmo_staff/models/vehicle.dart';
import 'package:eltracmo_staff/services/common/api_service.dart';
import 'package:eltracmo_staff/services/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleService {
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static Future<List<Vehicle>> getAllVehiclesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var data = await ApiService.getRequest(allVehiclesRoute, headers: headers);

    if (data == null || data.isEmpty) {
      return <Vehicle>[];
    }

    // return data as a list of Vehicle
    return data.map<Vehicle>((json) => Vehicle.fromJson(json)).toList();
  }

  static Future<Vehicle?> saveVehicle(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var response = await ApiService.postRequest(
      allVehiclesRoute,
      data,
      headers,
    );

    if (response == null) {
      return null;
    }

    return Vehicle.fromJson(response);
  }
}
