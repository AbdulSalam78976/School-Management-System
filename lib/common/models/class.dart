import 'teacher.dart';
import 'student.dart';

class Class {
  final String id;
  final String name;
  final String section;
  final String subject;
  final Teacher teacher;
  final List<Student> students;

  Class({
    required this.id,
    required this.name,
    required this.section,
    required this.subject,
    required this.teacher,
    required this.students,
  });
}
