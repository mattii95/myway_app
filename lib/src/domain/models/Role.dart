class Role {
  int id;
  String name;
  String type;
  String imageUrl;
  String route;
  DateTime createdAt;
  DateTime updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.route,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    imageUrl: json["imageUrl"],
    route: json["route"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "imageUrl": imageUrl,
    "route": route,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}