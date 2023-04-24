import 'package:eltracmo_staff/models/vehicle.dart';

class Appointment {
  String? id;
  String? vehicleId;
  Vehicle? vehicle;
  String? appointmentDate;
  String? appointmentTime;
  String? createdAt;
  String? updatedAt;

  Appointment(
      {this.id,
      this.vehicleId,
      this.vehicle,
      this.appointmentDate,
      this.appointmentTime,
      this.createdAt,
      this.updatedAt});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleId = json['vehicle_id'];
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_id'] = vehicleId;
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
