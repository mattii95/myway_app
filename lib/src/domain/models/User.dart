import 'package:myway_app/src/domain/models/Role.dart';

class User {
  int id;
  String name;
  String surname;
  String phone;
  String email;
  dynamic urlImage;
  dynamic notificationToken;
  DateTime createdAt;
  DateTime updatedAt;
  List<Role> roles;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.urlImage,
    required this.notificationToken,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    phone: json["phone"],
    email: json["email"],
    urlImage: json["urlImage"],
    notificationToken: json["notificationToken"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "phone": phone,
    "email": email,
    "urlImage": urlImage,
    "notificationToken": notificationToken,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}