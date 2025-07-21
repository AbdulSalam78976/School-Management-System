import 'teacher.dart';
import 'student.dart';

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
