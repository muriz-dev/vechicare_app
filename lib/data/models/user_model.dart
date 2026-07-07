class UserModel {
  final String name;
  final String email;

  const UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
