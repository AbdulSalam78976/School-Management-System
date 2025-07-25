import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/models/assignment.dart';
import 'package:school_app/common/models/student.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'assignment_controller.dart';
import 'package:intl/intl.dart';

class AssignmentSubmissionsScreen extends StatefulWidget {
  const AssignmentSubmissionsScreen({super.key});

  @override
  State<AssignmentSubmissionsScreen> createState() =>
      _AssignmentSubmissionsScreenState();
}

class _AssignmentSubmissionsScreenState
    extends State<AssignmentSubmissionsScreen> {
  late Assignment assignment;
  late String classId;

  @override
  void initState() {
    super.initState();
    classId = Get.arguments['classId'] ?? '';
    assignment = Get.arguments['assignment'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherAssignmentController>();

    // Fetch students and submissions from the controller
    // For now, get students from the assignment's classId (dummy logic, replace with real class fetch)
    final List<Student> students = [
      // In a real app, fetch students from the class controller or provider
      Student(
        id: 's1',
        name: 'Alice Smith',
        avatarUrl: '',
        enrollmentId: 'E001',
        grade: 'A',
        enrolledSubjects: [],
        email: '',
      ),
      Student(
        id: 's2',
        name: 'Bob Johnson',
        avatarUrl: '',
        enrollmentId: 'E002',
        grade: 'B',
        enrolledSubjects: [],
        email: '',
      ),
      Student(
        id: 's3',
        name: 'Charlie Lee',
        avatarUrl: '',
        enrollmentId: 'E003',
        grade: 'C',
        enrolledSubjects: [],
        email: '',
      ),
    ];
    final List<AssignmentSubmission> submissions = controller
        .getSubmissionsForAssignment(assignment.id);

    // Group students by submission status
    final List<Student> submittedStudents = students.where((student) {
      final submission = submissions.firstWhere(
        (s) => s.studentId == student.id,
        orElse: () => AssignmentSubmission(studentId: student.id),
      );
      return submission.isSubmitted;
    }).toList();
    final List<Student> notSubmittedStudents = students.where((student) {
      final submission = submissions.firstWhere(
        (s) => s.studentId == student.id,
        orElse: () => AssignmentSubmission(studentId: student.id),
      );
      return !submission.isSubmitted;
    }).toList();

    Widget StudentTile(
      Student student, {
      bool submitted = false,
      DateTime? date,
    }) {
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
        subtitle: submitted && date != null
            ? Text(
                'Submitted on ${DateFormat('MMMM d, yyyy').format(date)}',
                style: const TextStyle(fontSize: 15, color: Color(0xFF6B8B82)),
              )
            : null,
        trailing: submitted
            ? const Icon(
                Icons.chevron_right,
                size: 32,
                color: Color(0xFF6B8B82),
              )
            : null,
        onTap: submitted
            ? () {
                // Navigate to detail screen for marks/feedback
                Get.toNamed(
                  RouteName.assignmentSubmissionsDetailScreen,
                  arguments: {
                    'assignmentId': assignment.id,
                    'classId': classId,
                    'studentId': student.id,
                  },
                );
              }
            : null,
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 16),
            const Text(
              'Submitted',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppPalette.textColor,
              ),
            ),
            const SizedBox(height: 12),
            ...submittedStudents.map((student) {
              final submission = submissions.firstWhere(
                (s) => s.studentId == student.id,
                orElse: () => AssignmentSubmission(studentId: student.id),
              );
              return StudentTile(
                student,
                submitted: true,
                date: submission.submissionDate,
              );
            }),
            const SizedBox(height: 32),
            const Text(
              'Not Submitted',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppPalette.textColor,
              ),
            ),
            const SizedBox(height: 12),
            ...notSubmittedStudents.map((student) => StudentTile(student)),
          ],
        ),
      ),
    );
  }
}
