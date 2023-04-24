import 'package:eltracmo_staff/models/appointment.dart';

class Job {
  String? id;
  Appointment? appointmentId;
  String? type;
  String? status;
  String? remarks;

  Job({this.id, this.appointmentId, this.type, this.status, this.remarks});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'] != null
        ? Appointment.fromJson(json['appointment_id'])
        : null;
    type = json['type'];
    status = json['status'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (appointmentId != null) {
      data['appointment_id'] = appointmentId!.toJson();
    }
    data['type'] = type;
    data['status'] = status;
    data['remarks'] = remarks;
    return data;
  }
}
