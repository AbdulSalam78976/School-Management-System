enum UserRole { teacher, student }

abstract class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final UserRole role;

  User({
    required this.email,
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.role,
  });
}
