// class User {
//   final int id;
//   final String name;
//   final String email;
//   final String role;
//   final String profilePhotoUrl;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.role,
//     required this.profilePhotoUrl,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       role: json['role'],
//       profilePhotoUrl: json['profile_photo_url'],
//     );
//   }
// }

// class User {
//   final int id;
//   final String name;
//   final String email;
//   final String role;
//   final String profilePhotoUrl;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.role,
//     required this.profilePhotoUrl,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       role: json['role'],
//       profilePhotoUrl: json['profile_photo_url'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'role': role,
//       'profile_photo_url': profilePhotoUrl,
//     };
//   }
// }

class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      profilePhotoUrl: json['profile_photo_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'profile_photo_url': profilePhotoUrl,
    };
  }
}

