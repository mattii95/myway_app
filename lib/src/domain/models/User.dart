import 'package:myway_app/src/domain/models/Role.dart';

class User {
  int? id;
  String name;
  String surname;
  String phone;
  String email;
  String? password;
  String? urlImage;
  String? notificationToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Role>? roles;
  List<String>? rolesTypes;

  User({
    this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    this.password,
    this.urlImage,
    this.notificationToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
    this.rolesTypes,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    urlImage: json["urlImage"],
    notificationToken: json["notificationToken"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    rolesTypes: List<String>.from(json["rolesTypes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "phone": phone,
    "email": email,
    "password": password,
    "urlImage": urlImage,
    "notificationToken": notificationToken,
    "roles":
        roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson())) : [],
    "rolesTypes":
        rolesTypes != null ? List<dynamic>.from(rolesTypes!.map((x) => x)) : [],
  };
}
