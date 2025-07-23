import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/assignment/assignment_tile.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_controller.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_create_widgte.dart';

class TeacherAssignmentScreen extends StatefulWidget {
  const TeacherAssignmentScreen({super.key});

  @override
  State<TeacherAssignmentScreen> createState() =>
      _TeacherAssignmentScreenState();
}

class _TeacherAssignmentScreenState extends State<TeacherAssignmentScreen> {
  late final String classId;
  late final String teacherId;

  @override
  void initState() {
    super.initState();
    classId = Get.arguments['classId'] ?? '';
    teacherId = Get.arguments['teacherId'] ?? '';
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherAssignmentController>();

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Obx(() {
        final classAssignments = controller.getAssignmentsbyClassId(classId);

        if (classAssignments.isEmpty) {
          return const Center(
            child: Text(
              'No assignments created yet.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: classAssignments.length,
          itemBuilder: (context, index) {
            final assignment = classAssignments[index];
            return AssignmentTile(assignment: assignment, classId: classId);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.primaryColor,
        onPressed: () {
          AssignmentCreate(context, classId, teacherId);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
