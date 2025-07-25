import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/assignment.dart';
import 'package:school_app/common/models/teacher.dart';

class TeacherAssignmentController extends GetxController {
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final attachments = <PlatformFile>[].obs;
  final isAssigned = false.obs;

  final Rxn<DateTime> dueDate = Rxn<DateTime>();
  final Rxn<TimeOfDay> dueTime = Rxn<TimeOfDay>();

  final obtainedmarksController = TextEditingController();
  final feedbackController = TextEditingController();
  final totalMarksController = TextEditingController();

  final RxList<Assignment> assignments = <Assignment>[].obs;
  final RxList<Assignment> filteredassignments = <Assignment>[].obs;

  // ✅ Logged-in teacher
  late final Teacher loggedInTeacher;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration.zero, () {
      appBarController.setTitle('Assignments');
      drawerController.setActiveIndex(1);
    });
  }

  @override
  void onClose() {
    appBarController.setTitle('Dashboard');
    drawerController.setActiveIndex(0);
    totalMarksController.dispose();
    obtainedmarksController.dispose();
    feedbackController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();

    // ✅ Hardcode the teacher for now
    loggedInTeacher = Teacher(
      id: '1',
      name: 'Mr. Ahmad',
      email: 'ahmad@example.com',
      avatarUrl: '',
      major: 'Mathematics',
    );

    _loadAssignmentData();
  }

  // ✅ Load assignments only for logged-in teacher
  void _loadAssignmentData() {
    final allAssignments = <Assignment>[
      Assignment(
        id: '1',
        title: 'Assignment 1',
        description: 'Draw Use case diagram for a school management system',
        dueDate: DateTime.now().add(Duration(days: 3)),
        dueTime: DateTime.now().add(Duration(hours: 3)),
        assignedDate: DateTime.now().subtract(Duration(days: 1)),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '1',

        teacherId: '1',
        totalMarks: 100,
        attachments: [],
        submissions: [
          AssignmentSubmission(
            studentId: 's1',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(days: 1)),
            marksObtained: 90,
            files: [],
          ),
        ],
        subjectId: '',
      ),
      Assignment(
        id: '2',
        title: 'Assignment 2',
        description: 'Do Chapter 4 Questions',
        dueDate: DateTime.now().add(Duration(days: 2)),
        dueTime: DateTime.now().add(Duration(hours: 6)),
        assignedDate: DateTime.now(),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '2',
        teacherId: '2',
        totalMarks: 100,
        attachments: [],
        submissions: [],
        subjectId: '',
      ),
    ];

    filteredassignments.assignAll(allAssignments);
  }

  void filterAssignmentsByClass(String classId) {
    filteredassignments.assignAll(
      assignments
          .where(
            (a) => a.classId == classId && a.teacherId == loggedInTeacher.id,
          )
          .toList(),
    );
  }

  void addAssignment(Assignment assignment) {
    assignments.add(assignment);
    filteredassignments.add(assignment);
  }

  void setAssignments(List<Assignment> newAssignments) {
    assignments.assignAll(newAssignments);
  }

  void updateAssignment(Assignment updatedAssignment) {
    final index = assignments.indexWhere((a) => a.id == updatedAssignment.id);
    if (index != -1) {
      assignments[index] = updatedAssignment;
    }
  }

  void deleteAssignment(String assignmentId) {
    assignments.removeWhere((a) => a.id == assignmentId);
  }

  List<AssignmentSubmission> getSubmissionsForAssignment(String assignmentId) {
    final assignment = assignments.firstWhereOrNull(
      (a) => a.id == assignmentId,
    );
    return assignment?.submissions ?? [];
  }

  void updateSubmission(
    String assignmentId,
    AssignmentSubmission updatedSubmission,
  ) {
    final assignmentIndex = assignments.indexWhere((a) => a.id == assignmentId);
    if (assignmentIndex != -1) {
      final assignment = assignments[assignmentIndex];
      final submissions = List<AssignmentSubmission>.from(
        assignment.submissions,
      );
      final subIndex = submissions.indexWhere(
        (s) => s.studentId == updatedSubmission.studentId,
      );
      if (subIndex != -1) {
        submissions[subIndex] = updatedSubmission;
      } else {
        submissions.add(updatedSubmission);
      }
      assignments[assignmentIndex] = Assignment(
        id: assignment.id,
        title: assignment.title,
        description: assignment.description,
        dueDate: assignment.dueDate,
        dueTime: assignment.dueTime,
        assignedDate: assignment.assignedDate,
        assignedTime: assignment.assignedTime,
        isSubmitted: assignment.isSubmitted,
        classId: assignment.classId,

        teacherId: assignment.teacherId,
        totalMarks: assignment.totalMarks,
        attachments: assignment.attachments,
        submissions: submissions,

        submissionDate: assignment.submissionDate,
        subjectId: '',
      );
    }
  }

  String? getStudentSubmissionFile(String assignmentId, String studentId) {
    final assignment = assignments.firstWhereOrNull(
      (a) => a.id == assignmentId,
    );
    final submission = assignment?.submissions.firstWhereOrNull(
      (s) => s.studentId == studentId,
    );
    // Return a file path, URL, or null
    return submission != null && submission.isSubmitted
        ? 'path/to/submitted/file.pdf'
        : null;
  }

  List<String> getSubmittedStudentIds(String assignmentId) {
    final assignment = assignments.firstWhereOrNull(
      (a) => a.id == assignmentId,
    );
    if (assignment == null) return [];
    return assignment.submissions
        .where((s) => s.isSubmitted)
        .map((s) => s.studentId)
        .toList();
  }

  // Get students who have NOT submitted the assignment
  List<String> getNotSubmittedStudentIds(
    String assignmentId,
    List<String> allStudentIds,
  ) {
    final submittedIds = getSubmittedStudentIds(assignmentId).toSet();
    return allStudentIds.where((id) => !submittedIds.contains(id)).toList();
  }

  void submitMarksAndFeedback({
    required String assignmentId,
    required String studentId,
  }) {
    final assignmentIndex = assignments.indexWhere((a) => a.id == assignmentId);
    if (assignmentIndex == -1) return;

    final assignment = assignments[assignmentIndex];
    final updatedSubmissions = List<AssignmentSubmission>.from(
      assignment.submissions,
    );

    final submissionIndex = updatedSubmissions.indexWhere(
      (s) => s.studentId == studentId,
    );

    if (submissionIndex != -1) {
      updatedSubmissions[submissionIndex] = AssignmentSubmission(
        studentId: studentId,
        marksObtained: int.tryParse(obtainedmarksController.text),

        feedback: feedbackController.text,
        isSubmitted: true,
        submissionDate: DateTime.now(),
        files: updatedSubmissions[submissionIndex].files,
      );

      assignments[assignmentIndex] = Assignment(
        id: assignment.id,
        title: assignment.title,
        description: assignment.description,
        classId: assignment.classId,

        totalMarks: assignment.totalMarks,
        assignedDate: assignment.assignedDate,
        assignedTime: assignment.assignedTime,
        dueDate: assignment.dueDate,
        dueTime: assignment.dueTime,
        teacherId: assignment.teacherId,
        attachments: assignment.attachments,
        isSubmitted: assignment.isSubmitted,
        submissionDate: assignment.submissionDate,
        submissions: updatedSubmissions,
        subjectId: '',
      );

      updateAssignment(assignments[assignmentIndex]);
    }
  }
}
