import 'user.dart';

class Student extends User {
  final String enrollmentId;
  final String grade;
  Student({
    required super.id,
    required super.name,
    required super.avatarUrl,
    required this.enrollmentId,
    required this.grade,
  });
}
