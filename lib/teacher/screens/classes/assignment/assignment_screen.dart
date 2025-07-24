import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/assignment/assignment_tile.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/models/class.dart';
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
  late final Class classdata;

  @override
  void initState() {
    super.initState();
    classdata = Get.arguments;
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
      body: SafeArea(
        child: Obx(() {
          final classAssignments = controller.getAssignmentsbyClassId(
            classdata.id,
          );

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
              return AssignmentTile(
                assignment: assignment,
                classId: classdata.id,
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.primaryColor,
        onPressed: () {
          AssignmentCreate(context, classdata.id, classdata.teacher.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
