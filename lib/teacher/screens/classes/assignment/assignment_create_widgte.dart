import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_app/common/models/assignment.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/utils/utils.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_controller.dart';

void AssignmentCreate(BuildContext context, String classId, String teacherId) {
  final controller = Get.find<TeacherAssignmentController>();

  // Clear old values
  controller.titleController.value.clear();
  controller.descriptionController.value.clear();
  controller.dueDate.value = null;
  controller.dueTime.value = null;
  controller.attachments.clear();
  // Add a controller for total marks
  controller.totalMarksController ??= TextEditingController();
  controller.totalMarksController!.clear();

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Row(
              children: [
                Icon(Icons.assignment_add, color: AppPalette.primaryColor),
                SizedBox(width: 8),
                Text("Create Assignment"),
              ],
            ),
            content: SingleChildScrollView(
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Assignment Details Section
                    Card(
                      color: AppPalette.backgroundColor.withOpacity(0.9),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Assignment Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppPalette.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: controller.titleController.value,
                              decoration: const InputDecoration(
                                labelText: "Title",
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: AppPalette.primaryColor,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller:
                                  controller.descriptionController.value,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                labelText: "Description",
                                prefixIcon: Icon(
                                  Icons.description,
                                  color: AppPalette.primaryColor,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: controller.totalMarksController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Total Marks",
                                helperText:
                                    "Enter the maximum marks for this assignment",
                                prefixIcon: Icon(
                                  Icons.score,
                                  color: AppPalette.primaryColor,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Due Information Section
                    Card(
                      color: AppPalette.backgroundColor.withOpacity(0.9),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Due Information",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppPalette.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: AppPalette.primaryColor,
                                ),
                                const SizedBox(width: 8),
                                const Text("Due Date:"),
                                TextButton(
                                  onPressed: () async {
                                    final picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now().add(
                                        const Duration(days: 1),
                                      ),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    );
                                    if (picked != null) {
                                      controller.dueDate.value = picked;
                                    }
                                  },
                                  child: Text(
                                    controller.dueDate.value == null
                                        ? "Select Date"
                                        : DateFormat(
                                            'dd/MM/yyyy',
                                          ).format(controller.dueDate.value!),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: AppPalette.primaryColor,
                                ),
                                const SizedBox(width: 8),
                                const Text("Due Time:"),
                                TextButton(
                                  onPressed: () async {
                                    final picked = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      controller.dueTime.value = picked;
                                    }
                                  },
                                  child: Text(
                                    controller.dueTime.value == null
                                        ? "Select Time"
                                        : controller.dueTime.value!.format(
                                            context,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Attachments Section
                    Card(
                      color: AppPalette.backgroundColor.withOpacity(0.9),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Attachments",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppPalette.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.attach_file,
                                  color: AppPalette.primaryColor,
                                ),
                                const SizedBox(width: 8),
                                const Text("Add files (optional):"),
                                const Spacer(),
                                TextButton.icon(
                                  onPressed: () async {
                                    final result = await FilePicker.platform
                                        .pickFiles(allowMultiple: true);
                                    if (result != null) {
                                      controller.attachments.assignAll(
                                        result.files,
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.upload_file),
                                  label: const Text("Choose"),
                                ),
                              ],
                            ),
                            if (controller.attachments.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 6,
                                    runSpacing: 4,
                                    children: controller.attachments.map((
                                      file,
                                    ) {
                                      return Chip(
                                        backgroundColor: AppPalette.accentColor,
                                        label: Text(
                                          file.name,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        avatar: const Icon(
                                          Icons.insert_drive_file,
                                          size: 18,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actionsPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  foregroundColor: AppPalette.errorColor,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: const Text("Cancel"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.assignment_turned_in_rounded),
                label: const Text("Create"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  if (controller.titleController.value.text.isEmpty ||
                      controller.descriptionController.value.text.isEmpty ||
                      controller.dueDate.value == null ||
                      controller.dueTime.value == null ||
                      controller.totalMarksController == null ||
                      controller.totalMarksController!.text.isEmpty) {
                    Utils.snackBar(
                      icon: Icons.error,
                      title: 'Error',
                      message: 'Please fill in all required fields.',
                    );
                    return;
                  }
                  final totalMarks = int.tryParse(
                    controller.totalMarksController!.text,
                  );
                  if (totalMarks == null || totalMarks <= 0) {
                    Utils.snackBar(
                      icon: Icons.error,
                      title: 'Error',
                      message: 'Please enter a valid number for total marks.',
                    );
                    return;
                  }

                  final fullDueDate = DateTime(
                    controller.dueDate.value!.year,
                    controller.dueDate.value!.month,
                    controller.dueDate.value!.day,
                    controller.dueTime.value!.hour,
                    controller.dueTime.value!.minute,
                  );

                  final assignment = Assignment(
                    totalMarks: totalMarks,

                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: controller.titleController.value.text,
                    description: controller.descriptionController.value.text,
                    dueDate: fullDueDate,
                    dueTime: fullDueDate,
                    assignedDate: DateTime.now(),
                    assignedTime: DateTime.now(),
                    isSubmitted: false,
                    classId: classId,
                    teacherId: teacherId,
                    subject: '', // Set this properly if needed
                    attachments: controller.attachments,
                  );

                  controller.addAssignment(assignment);
                  Get.back();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
