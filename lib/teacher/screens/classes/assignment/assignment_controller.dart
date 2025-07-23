import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/assignment.dart';

class TeacherAssignmentController extends GetxController {
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  final titleController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  final attachments = <PlatformFile>[].obs;

  // Add a controller for total marks
  TextEditingController? totalMarksController;

  final isAssigned = false.obs;
  final Rxn<DateTime> dueDate = Rxn<DateTime>();
  final Rxn<TimeOfDay> dueTime = Rxn<TimeOfDay>();

  final RxList<Assignment> assignments = <Assignment>[].obs;

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
    totalMarksController?.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    _loadAssignmentData();
    totalMarksController = TextEditingController();
  }

  void setAssignments(List<Assignment> newAssignments) {
    assignments.assignAll(newAssignments);
  }

  void addAssignment(Assignment newAssignment) {
    assignments.add(newAssignment);
    totalMarksController?.clear();
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

  getAssignmentsbyClassId(String classId) {
    return assignments.where((a) => a.classId == classId).toList();
  }

  // Get all submissions for a given assignment
  List<AssignmentSubmission> getSubmissionsForAssignment(String assignmentId) {
    final assignment = assignments.firstWhereOrNull(
      (a) => a.id == assignmentId,
    );
    return assignment?.submissions ?? [];
  }

  // Update a student's submission (e.g., marks, status, file)
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
        subject: assignment.subject,
        teacherId: assignment.teacherId,
        totalMarks: assignment.totalMarks,
        attachments: assignment.attachments,
        submissions: submissions,
        feedback: assignment.feedback,
        submissionDate: assignment.submissionDate,
      );
    }
  }

  // Placeholder: Get the file or work submitted by a student for an assignment
  // In a real app, this would fetch the file from storage or backend
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

  void _loadAssignmentData() {
    assignments.assignAll([
      Assignment(
        id: '1',
        title: 'Assignment 1',
        description: 'Draw Use case diagram for a school management system',
        dueDate: DateTime.now(),
        dueTime: DateTime.now().add(Duration(days: 3)),
        assignedDate: DateTime.now().subtract(
          Duration(days: 1),
        ), // or any assigned date
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '1', // replace with actual class ID
        subject: 'Mathematics', // replace with actual subject
        teacherId: '1', // replace with actual teacher ID
        totalMarks: 100,
      ),
      Assignment(
        id: '2',
        title: 'Assignment 2',
        description: 'Complete assignment 2',
        dueDate: DateTime.now().add(Duration(days: 3)),
        assignedDate: DateTime.now(),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        dueTime: DateTime.now().add(Duration(days: 3)),
        classId: '2',
        subject: 'Science',
        teacherId: '2',
        totalMarks: 100,
      ),
    ]);
  }
}
