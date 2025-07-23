import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/models/assignment.dart';
import 'package:school_app/common/models/class.dart';
import 'package:school_app/common/models/student.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'assignment_controller.dart';

class AssignmentSubmissionsScreen extends StatelessWidget {
  final String assignmentId;
  final String classId;
  const AssignmentSubmissionsScreen({
    super.key,
    required this.assignmentId,
    required this.classId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherAssignmentController>();
    final assignment = controller.assignments.firstWhere(
      (a) => a.id == assignmentId,
    );
    // Fetch students and submissions from the controller
    // For now, get students from the assignment's classId (dummy logic, replace with real class fetch)
    final List<Student> students = [
      // In a real app, fetch students from the class controller or provider
      Student(
        id: 's1',
        name: 'Alice Smith',
        avatarUrl: 'assets/images/biology.png',
        enrollmentId: 'E001',
        grade: 'A',
      ),
      Student(
        id: 's2',
        name: 'Bob Johnson',
        avatarUrl: 'assets/images/chemistry.png',
        enrollmentId: 'E002',
        grade: 'B',
      ),
      Student(
        id: 's3',
        name: 'Charlie Lee',
        avatarUrl: 'assets/images/maths.png',
        enrollmentId: 'E003',
        grade: 'C',
      ),
    ];
    final List<AssignmentSubmission> submissions = controller
        .getSubmissionsForAssignment(assignmentId);

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: students.isEmpty
          ? const Center(child: Text('No students found.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: students.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final student = students[index];
                final submission = submissions.firstWhere(
                  (s) => s.studentId == student.id,
                  orElse: () => AssignmentSubmission(studentId: student.id),
                );
                final marksController = TextEditingController(
                  text: submission.marksObtained?.toString() ?? '',
                );
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(student.avatarUrl),
                        radius: 24,
                      ),
                      const SizedBox(width: 16),
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
                              submission.isSubmitted
                                  ? 'Submitted'
                                  : 'Not Submitted',
                              style: TextStyle(
                                color: submission.isSubmitted
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (submission.isSubmitted &&
                                submission.submissionDate != null)
                              Text(
                                'Submitted on: ${submission.submissionDate}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            if (submission.isSubmitted)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.visibility),
                                  label: const Text('View Work'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppPalette.secondaryColor,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(100, 36),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () {
                                    final filePath = controller
                                        .getStudentSubmissionFile(
                                          assignmentId,
                                          student.id,
                                        );
                                    if (filePath != null) {
                                      // In a real app, open the file or show a preview
                                      Get.snackbar(
                                        'View Work',
                                        'Would open: ' + filePath,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'No File',
                                        'No work submitted.',
                                      );
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 60,
                        child: TextField(
                          controller: marksController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Marks',
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          onSubmitted: (val) {
                            final marks = num.tryParse(val);
                            if (marks != null) {
                              // Update marks in the controller
                              final updated = AssignmentSubmission(
                                studentId: student.id,
                                isSubmitted: submission.isSubmitted,
                                submissionDate: submission.submissionDate,
                                marksObtained: marks,
                              );
                              controller.updateSubmission(
                                assignmentId,
                                updated,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
