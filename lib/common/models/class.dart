import 'student.dart';
import 'subject.dart';
import 'teacher.dart';

class SchoolClass {
  final String id;
  final String name;
  final String section;
  final List<Subject> subjects;
  final List<Student> students;
  final Teacher classTeacher; // 🆕 Added class teacher

  SchoolClass({
    required this.id,
    required this.name,
    required this.section,
    required this.subjects,
    required this.students,
    required this.classTeacher,
  });
}
