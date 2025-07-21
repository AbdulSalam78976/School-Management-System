import 'user.dart';

class Teacher extends User {
  final String employeeId;
  final List<String> subjects;

  Teacher({
    required super.id,
    required super.name,
    required super.avatarUrl,
    required this.employeeId,
    required this.subjects,
  });
}
