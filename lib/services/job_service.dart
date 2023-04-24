import 'package:eltracmo_staff/models/appointment.dart';
import 'package:eltracmo_staff/models/job.dart';
import 'package:eltracmo_staff/services/common/api_service.dart';
import 'package:eltracmo_staff/services/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobService {
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static Future<List<Job?>> getAllJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var data = await ApiService.getRequest(allJobsRoute, headers: headers);

    // get data as a list of Job classes
    if (data != null) {
      List<Job?> jobs = data.map<Job?>((json) => Job.fromJson(json)).toList();

      return jobs.toList();
    }

    return data;
  }

  static Future<Job?> saveJob(Appointment appointment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var data = await ApiService.postRequest(
      createJobRoute,
      appointment.toJson(),
      headers,
    );

    // check for null and return null
    if (data == null) {
      return null;
    }

    // return the data as a Job class
    return Job.fromJson(data);
  }

  // static Future<Job> getJobStatusHistory(jobId) async {}
}
