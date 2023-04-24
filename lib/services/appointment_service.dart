import 'package:eltracmo_staff/models/appointment.dart';
import 'package:eltracmo_staff/services/common/api_service.dart';
import 'package:eltracmo_staff/services/common/routes.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentService {
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static Future<Appointment?> saveAppointment(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var response = await ApiService.postRequest(
      addAppointmentRoute,
      data,
      headers,
    );

    if (response == null) {
      return null;
    }

    return Appointment.fromJson(response);
  }

  static Future<List<Appointment?>> getAppointments(
      DateTime selectedDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    // format date to yyyy-mm-dd
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    var route = '$byDateAppointmentsRoute$formattedDate';

    var data = await ApiService.getRequest(
      route,
      headers: headers,
    );

    if (data != null) {
      List<Appointment?> appointments =
          data.map<Appointment?>((json) => Appointment.fromJson(json)).toList();

      return appointments.toList();
    }

    return [];
  }

  static Future<List<Appointment?>> getAllAppointments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var data = await ApiService.getRequest(
      allAppointmentsRoute,
      headers: headers,
    );

    if (data != null) {
      List<Appointment?> appointments =
          data.map<Appointment?>((json) => Appointment.fromJson(json)).toList();

      return appointments.toList();
    }

    return [];
  }

  static Future<bool> cancelAppointment(String appointmentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var response = await ApiService.deleteRequest(
      '$deleteAppointmentRoute/$appointmentId',
      headers,
    );

    if (response == null) {
      return false;
    }

    return true;
  }
}
