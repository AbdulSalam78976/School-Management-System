import 'user.dart';

class Teacher extends User {
  final List<String> subjects;
  final String major; // 🆕 Added field

  Teacher({
    required super.id,
    required super.name,
    required super.avatarUrl,

    required this.subjects,
    required this.major, // 🆕 Constructor param
  });
}
