import 'dart:convert';

class UserModel {
  UserModel({
    this.id = '',
    this.name = '',
    this.email = '',
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
      );

  factory UserModel.fromJson(
    String source,
  ) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final String email;

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'UserModel(id: $id, name: $name, email: $email)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
