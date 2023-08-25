import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String age;
  final String image;
  User({
    required this.name,
    required this.age,
    required this.image,
  });

  User copyWith({
    String? name,
    String? age,
    String? image,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age, image: $image)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ image.hashCode;
}
