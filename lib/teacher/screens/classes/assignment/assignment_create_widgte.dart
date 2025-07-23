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

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Assignment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.primaryColor,
                  ),
                ),
                const SizedBox(height: 16),

                // Title
                TextField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Description
                TextField(
                  controller: controller.descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Total Marks
                TextField(
                  controller: controller.totalMarksController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Total Marks",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Due Date
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 8),
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

                // Due Time
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 8),
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
                            : controller.dueTime.value!.format(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Attachments
                Row(
                  children: [
                    const Icon(Icons.attach_file),
                    const SizedBox(width: 8),
                    const Text("Attachments"),
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                        );
                        if (result != null) {
                          controller.attachments.assignAll(result.files);
                        }
                      },
                      child: const Text("Pick Files"),
                    ),
                  ],
                ),
                if (controller.attachments.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: controller.attachments.map((file) {
                      return Chip(
                        label: Text(file.name),
                        avatar: const Icon(Icons.insert_drive_file),
                      );
                    }).toList(),
                  ),

                const SizedBox(height: 20),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.assignment_turned_in),
                    label: const Text("Create Assignment"),
                    onPressed: () {
                      if (controller.titleController.text.isEmpty ||
                          controller.descriptionController.text.isEmpty ||
                          controller.dueDate.value == null ||
                          controller.dueTime.value == null ||
                          controller.totalMarksController.text.isEmpty) {
                        Utils.snackBar(
                          icon: Icons.error,
                          title: 'Missing Fields',
                          message: 'Please complete all required fields.',
                        );
                        return;
                      }

                      final totalMarks = int.tryParse(
                        controller.totalMarksController.text,
                      );
                      if (totalMarks == null || totalMarks <= 0) {
                        Utils.snackBar(
                          icon: Icons.error,
                          title: 'Invalid Marks',
                          message: 'Enter a valid number for total marks.',
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
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: controller.titleController.text,
                        description: controller.descriptionController.text,
                        totalMarks: totalMarks,
                        dueDate: fullDueDate,
                        dueTime: fullDueDate,
                        assignedDate: DateTime.now(),
                        assignedTime: DateTime.now(),
                        isSubmitted: false,
                        classId: classId,
                        teacherId: teacherId,
                        subject: '', // Replace if needed
                        attachments: controller.attachments,
                      );

                      controller.addAssignment(assignment);
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
    },
  );
}
