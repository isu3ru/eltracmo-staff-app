class Vehicle {
  String? id;
  String? customerId;
  String? title;
  String? make;
  String? model;
  String? edition;
  String? registeredYear;
  String? registrationNumber;
  int? currentMileage;
  String? color;
  String? remarks;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Vehicle(
      {this.id,
      this.customerId,
      this.title,
      this.make,
      this.model,
      this.edition,
      this.registeredYear,
      this.registrationNumber,
      this.currentMileage,
      this.color,
      this.remarks,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    make = json['make'];
    model = json['model'];
    edition = json['edition'];
    registeredYear = json['registered_year'];
    registrationNumber = json['registration_number'];
    currentMileage = json['current_mileage'];
    color = json['color'];
    remarks = json['remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['title'] = title;
    data['make'] = make;
    data['model'] = model;
    data['edition'] = edition;
    data['registered_year'] = registeredYear;
    data['registration_number'] = registrationNumber;
    data['current_mileage'] = currentMileage;
    data['color'] = color;
    data['remarks'] = remarks;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
