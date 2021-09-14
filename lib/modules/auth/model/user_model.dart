class User {
  String? id;
  String? name;
  String? email;
  String? classroom;
  String? studyDivision;
  bool? admin;
  List<dynamic>? attendance;
  String? createdAt;
  String? updatedAt;

  User({
    this.admin,
    this.attendance,
    this.classroom,
    this.createdAt,
    this.email,
    this.id,
    this.name,
    this.studyDivision,
    this.updatedAt,
  });

  factory User.fromJson(json) => User(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        classroom: json['classroom'],
        studyDivision: json['studyDivision'],
        admin: json['admin'],
        attendance: json['attendance'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {'email': email};
}
