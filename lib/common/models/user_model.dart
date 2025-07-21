export 'user.dart';
export 'student.dart';
export 'teacher.dart';
export 'school_class.dart';

// A base class for common user properties
abstract class User {
  final String id;
  final String name;
  final String avatarUrl;

  User({required this.id, required this.name, required this.avatarUrl});
}

// Student model extending the base User class
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

// Teacher model extending the base User class
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

// General Class model
class SchoolClass {
  final String id;
  final String name;
  final String section;
  final String subject;
  final Teacher teacher;
  final List<Student> students;

  SchoolClass({
    required this.id,
    required this.name,
    required this.section,
    required this.subject,
    required this.teacher,
    required this.students,
  });
}
