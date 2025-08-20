import 'user.dart';

class Student extends User {
  final String enrollmentId;
  final String grade;

  Student({
    required this.enrollmentId,
    required this.grade,

    required super.email,
    required super.id,
    required super.name,
    required super.avatarUrl,
  }) : super(role: UserRole.student);
}
