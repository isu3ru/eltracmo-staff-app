class User {
  String? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? fcmToken;

  User({this.id, this.name, this.mobileNumber, this.email, this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
