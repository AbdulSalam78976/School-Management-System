import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/teacher/screens/attendance/attendance_controller.dart';

class StudentListView extends StatelessWidget {
  final AttendanceController controller = Get.find();

  StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.filteredclasses.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      final displayedStudents = controller
          .filteredclasses[controller.selectedClassIndex.value]
          .students;

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displayedStudents.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final student = displayedStudents[i];
          final currentStatus =
              controller.attendanceStatus[student.id] ?? 'Present';

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(student.avatarUrl),
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentStatus,
                        style: TextStyle(
                          color: statusColor(currentStatus),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAttendanceRadioButton(
                      value: 'Present',
                      groupValue: currentStatus,
                      onChanged: (newStatus) => controller
                          .updateAttendanceStatus(student.id, newStatus),
                      activeColor: Colors.green,
                    ),
                    _buildAttendanceRadioButton(
                      value: 'Absent',
                      groupValue: currentStatus,
                      onChanged: (newStatus) => controller
                          .updateAttendanceStatus(student.id, newStatus),
                      activeColor: Colors.red,
                    ),
                    _buildAttendanceRadioButton(
                      value: 'Leave',
                      groupValue: currentStatus,
                      onChanged: (newStatus) => controller
                          .updateAttendanceStatus(student.id, newStatus),
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }

  // --- Helper Methods ---
  Color statusColor(String status) {
    switch (status) {
      case "Present":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Leave":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildAttendanceRadioButton({
    required String value,
    required String groupValue,
    required ValueChanged<String> onChanged,
    required Color activeColor,
  }) {
    final bool isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.grey.shade200,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? activeColor : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            value[0], // P, A, L
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
