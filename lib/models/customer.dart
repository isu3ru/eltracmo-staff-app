import 'package:eltracmo_staff/models/user.dart';

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? address;
  String? photo;
  User? user;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.email,
      this.address,
      this.photo,
      this.user});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    address = json['address'];
    photo = json['photo'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['address'] = address;
    data['photo'] = photo;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
