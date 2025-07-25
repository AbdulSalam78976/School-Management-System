import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/models/assignment.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class AssignmentTile extends StatelessWidget {
  final Assignment assignment;
  final String classId;

  const AssignmentTile({
    Key? key,
    required this.assignment,
    required this.classId,
  }) : super(key: key);

  String formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          RouteName.assignmentSubmissionsScreen,
          arguments: {'assignment': assignment, 'classId': classId},
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [AppPalette.primaryColor, AppPalette.secondaryColor],
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
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
                Text(
                  'Due: ${formatDate(assignment.dueDate)}',
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Time: ${assignment.dueTime ?? 'N/A'}',
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Text(
              'Total Marks: ${assignment.totalMarks}',
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
