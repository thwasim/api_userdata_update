import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  Userdata({
    required this.data,
    this.itemCount,
  });

  List<Datum> data;
  int? itemCount;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "itemCount": itemCount,
      };
}

class Datum {
  Datum({
    this.userId,
    this.imageBinary,
    this.username,
    this.email,
    this.mobile,
    this.address,
  });

  String? userId;
  String? imageBinary;
  String? username;
  String? email;
  String? mobile;
  String? address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        imageBinary: json["imageBinary"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "imageBinary": imageBinary,
        "username": username,
        "email": email,
        "mobile": mobile,
        "address": address,
      };
}
