import 'user.dart';
import 'subject.dart';

class Student extends User {
  final String enrollmentId;
  final String grade;
  final List<Subject> enrolledSubjects;

  Student({
    required this.enrollmentId,
    required this.grade,
    required this.enrolledSubjects,
    required super.email,
    required super.id,
    required super.name,
    required super.avatarUrl,
  }) : super(role: UserRole.student);
}
