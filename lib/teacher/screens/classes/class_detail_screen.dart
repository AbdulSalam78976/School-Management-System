import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/models/class.dart';
import 'package:school_app/common/models/student.dart';
import 'package:school_app/teacher/screens/classes/classes_controller.dart';

class ClassDetailScreen extends StatefulWidget {
  const ClassDetailScreen({super.key});

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  late final Class classData;

  @override
  void initState() {
    super.initState();
    classData = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherClassesController>();
    controller.appBarController.setTitle(classData.name);

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Students",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: classData.students.length,
                itemBuilder: (context, index) {
                  final student = classData.students[index];
                  return buildStudentTile(student);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Student ListTile with name, attendance, and action button
  Widget buildStudentTile(Student student) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      leading: CircleAvatar(
        backgroundImage: AssetImage(student.avatarUrl),
        radius: 28,
      ),
      title: Text(
        student.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        'Attendance: 80%', // fallback if null
        style: const TextStyle(fontSize: 15, color: Color(0xFF6B8B82)),
      ),
      trailing: IconButton(
        onPressed: () {
          // Navigate to student details
        },
        icon: const Icon(
          Icons.chevron_right,
          size: 32,
          color: Color(0xFF6B8B82),
        ),
      ),
    );
  }
}
