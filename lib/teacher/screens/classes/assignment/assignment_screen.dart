import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_controller.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_create_widgte.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_submissions_screen.dart';

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
            return InkWell(
              onTap: () {
                Get.to(
                  () => AssignmentSubmissionsScreen(
                    assignmentId: assignment.id,
                    classId: classId,
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [AppPalette.secondaryColor, AppPalette.accentColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      assignment.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// Description
                    Text(
                      assignment.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// Date & Time Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Assigned: ${formatDate(assignment.assignedDate)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          'Due: ${formatDate(assignment.dueDate)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Time: ${assignment.dueTime ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Total Marks: ${assignment.totalMarks}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            );
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
