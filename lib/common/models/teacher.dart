import 'user.dart';

class Teacher extends User {
  final String major;

  Teacher({
    required super.id,
    required super.name,
    required super.avatarUrl,
    required super.email,
    required this.major,
  }) : super(role: UserRole.teacher);
}
