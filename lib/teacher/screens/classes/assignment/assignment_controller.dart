import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/assignment.dart';
import 'package:school_app/common/models/student.dart';
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
  final RxList<Assignment> filteredAssignments = <Assignment>[].obs;
  final RxList<Student> dummyStudents = <Student>[].obs;

  // ✅ Logged-in teacher
  late final Teacher loggedInTeacher;

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

    _loadDummyStudents();
    _loadAssignmentData();
  }

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
    super.onClose();
  }

  // ✅ Load dummy students
  void _loadDummyStudents() {
    dummyStudents.assignAll([
      Student(
        id: 's1',
        name: 'Ali Hassan',
        email: 'ali.hassan@school.com',
        avatarUrl: '',
        enrollmentId: '',
        grade: '',
      ),
      Student(
        id: 's2',
        name: 'Fatima Ahmed',
        email: 'fatima.ahmed@school.com',
        avatarUrl: '',
        enrollmentId: '',
        grade: '',
      ),
      Student(
        id: 's3',
        name: 'Omar Khan',
        email: 'omar.khan@school.com',
        avatarUrl: '',
        enrollmentId: '',
        grade: '',
      ),
      Student(
        id: 's4',
        name: 'Aisha Malik',
        email: 'aisha.malik@school.com',
        avatarUrl: '',
        enrollmentId: '',
        grade: '',
      ),
      Student(
        id: 's5',
        name: 'Yusuf Ali',
        email: 'yusuf.ali@school.com',
        avatarUrl: '',
        enrollmentId: '',
        grade: '',
      ),
    ]);
  }

  // ✅ Load assignments created by the logged-in teacher only with student submissions
  void _loadAssignmentData() {
    final allAssignments = <Assignment>[
      Assignment(
        id: '1',
        title: 'Algebra Homework - Quadratic Equations',
        description:
            'Solve the following quadratic equations and show your work:\n1. x² - 5x + 6 = 0\n2. 2x² + 3x - 2 = 0\n3. x² - 4x + 4 = 0',
        dueDate: DateTime.now().add(Duration(days: 3)),
        dueTime: DateTime.now().add(Duration(hours: 3)),
        assignedDate: DateTime.now().subtract(Duration(days: 2)),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '1',
        teacherId: '1',
        totalMarks: 20,
        attachments: [],
        submissions: [
          AssignmentSubmission(
            studentId: 's1',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(days: 1)),
            marksObtained: 18,
            feedback:
                'Excellent work! All equations solved correctly with proper steps.',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's2',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(days: 1)),
            marksObtained: 16,
            feedback: 'Good effort. Minor calculation errors in question 2.',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's3',
            isSubmitted: true,
            submissionDate: DateTime.now(),
            marksObtained: null, // Not graded yet
            feedback: '',
            files: [],
          ),
        ],
        subjectId: 'math',
      ),
      Assignment(
        id: '2',
        title: 'Geometry Quiz - Triangles',
        description:
            'Answer the following questions about triangles:\n1. Define different types of triangles\n2. Calculate area of a triangle with base=8cm, height=5cm\n3. Prove Pythagoras theorem',
        dueDate: DateTime.now().add(Duration(days: 1)),
        dueTime: DateTime.now().add(Duration(hours: 6)),
        assignedDate: DateTime.now().subtract(Duration(days: 1)),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '1',
        teacherId: '1',
        totalMarks: 15,
        attachments: [],
        submissions: [
          AssignmentSubmission(
            studentId: 's1',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(hours: 12)),
            marksObtained: 14,
            feedback: 'Well explained answers. Good understanding of concepts.',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's2',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(hours: 8)),
            marksObtained: 12,
            feedback: 'Good attempt. Need to work on theorem proofs.',
            files: [],
          ),
        ],
        subjectId: 'math',
      ),
      Assignment(
        id: '3',
        title: 'Calculus Assignment - Derivatives',
        description:
            'Find the derivatives of the following functions:\n1. f(x) = 3x² + 2x - 1\n2. f(x) = sin(x) + cos(x)\n3. f(x) = e^x * ln(x)',
        dueDate: DateTime.now().add(Duration(days: 5)),
        dueTime: DateTime.now().add(Duration(hours: 2)),
        assignedDate: DateTime.now(),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '2',
        teacherId: '1',
        totalMarks: 25,
        attachments: [],
        submissions: [
          AssignmentSubmission(
            studentId: 's4',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(days: 1)),
            marksObtained: 22,
            feedback: 'Excellent work! All derivatives calculated correctly.',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's5',
            isSubmitted: true,
            submissionDate: DateTime.now().subtract(Duration(hours: 6)),
            marksObtained: 19,
            feedback: 'Good attempt. Minor errors in chain rule application.',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's6',
            isSubmitted: true,
            submissionDate: DateTime.now(),
            marksObtained: null, // Not graded yet
            feedback: '',
            files: [],
          ),
        ],
        subjectId: 'math',
      ),
      Assignment(
        id: '4',
        title: 'Statistics Project',
        description:
            'Collect data and create a statistical analysis report with mean, median, mode, and standard deviation.',
        dueDate: DateTime.now().add(Duration(days: 7)),
        dueTime: DateTime.now().add(Duration(hours: 4)),
        assignedDate: DateTime.now().subtract(Duration(days: 3)),
        assignedTime: DateTime.now(),
        isSubmitted: false,
        classId: '1',
        teacherId: '1',
        totalMarks: 30,
        attachments: [],
        submissions: [
          AssignmentSubmission(
            studentId: 's1',
            isSubmitted: false, // Not submitted yet
            submissionDate: null,
            marksObtained: null,
            feedback: '',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's2',
            isSubmitted: false, // Not submitted yet
            submissionDate: null,
            marksObtained: null,
            feedback: '',
            files: [],
          ),
          AssignmentSubmission(
            studentId: 's3',
            isSubmitted: false, // Not submitted yet
            submissionDate: null,
            marksObtained: null,
            feedback: '',
            files: [],
          ),
        ],
        subjectId: 'math',
      ),
    ];

    // ✅ Filter assignments to only include those created by the logged-in teacher
    final teacherAssignments = allAssignments
        .where((assignment) => assignment.teacherId == loggedInTeacher.id)
        .toList();

    assignments.assignAll(teacherAssignments);
    filteredAssignments.assignAll(teacherAssignments);
  }

  // ✅ Get student by ID
  Student? getStudentById(String studentId) {
    return dummyStudents.firstWhereOrNull((student) => student.id == studentId);
  }

  // ✅ Get students by class
  List<Student> getStudentsByClass(String classId) {
    return dummyStudents
        .where((SchoolClass) => SchoolClass.id == classId)
        .toList();
  }

  // ✅ Get students who submitted a particular assignment
  List<Student> getStudentsWhoSubmitted(String assignmentId) {
    final assignment = getAssignmentById(assignmentId);
    if (assignment == null) return [];

    return assignment.submissions
        .where(
          (submission) =>
              submission.isSubmitted && submission.submissionDate != null,
        )
        .map((submission) => getStudentById(submission.studentId))
        .where((student) => student != null)
        .map((student) => student!)
        .toList();
  }

  // ✅ Get students who haven't submitted a particular assignment
  List<Student> getStudentsWhoNotSubmitted(String assignmentId) {
    final assignment = getAssignmentById(assignmentId);
    if (assignment == null) return [];

    final submittedStudentIds = assignment.submissions
        .where(
          (submission) =>
              submission.isSubmitted && submission.submissionDate != null,
        )
        .map((submission) => submission.studentId)
        .toSet();

    return getStudentsByClass(
      assignment.classId,
    ).where((student) => !submittedStudentIds.contains(student.id)).toList();
  }

  // ✅ Get submission for a specific student and assignment
  AssignmentSubmission? getStudentSubmission(
    String assignmentId,
    String studentId,
  ) {
    final assignment = getAssignmentById(assignmentId);
    if (assignment == null) return null;

    return assignment.submissions.firstWhereOrNull(
      (submission) => submission.studentId == studentId,
    );
  }

  // ✅ Check if student has submitted an assignment
  bool hasStudentSubmitted(String assignmentId, String studentId) {
    final submission = getStudentSubmission(assignmentId, studentId);
    return submission != null &&
        submission.isSubmitted &&
        submission.submissionDate != null;
  }

  // ✅ Get all assignments by this teacher
  List<Assignment> get teacherAssignments => assignments;

  // ✅ Get assignments by class for this teacher
  List<Assignment> getAssignmentsByClass(String classId) {
    return assignments
        .where((assignment) => assignment.classId == classId)
        .toList();
  }

  // ✅ Get assignments by subject for this teacher
  List<Assignment> getAssignmentsBySubject(String subjectId) {
    return assignments
        .where((assignment) => assignment.subjectId == subjectId)
        .toList();
  }

  // ✅ Get assignments with submissions
  List<Assignment> get assignmentsWithSubmissions {
    return assignments
        .where(
          (assignment) => assignment.submissions.any(
            (submission) =>
                submission.isSubmitted && submission.submissionDate != null,
          ),
        )
        .toList();
  }

  // ✅ Get assignments pending grading
  List<Assignment> get assignmentsPendingGrading {
    return assignments.where((assignment) {
      final hasSubmissions = assignment.submissions.any(
        (submission) =>
            submission.isSubmitted && submission.submissionDate != null,
      );
      final hasUngradedSubmissions = assignment.submissions.any(
        (submission) =>
            submission.isSubmitted &&
            submission.submissionDate != null &&
            submission.marksObtained == null,
      );
      return hasSubmissions && hasUngradedSubmissions;
    }).toList();
  }

  // ✅ Get assignments with no submissions yet
  List<Assignment> get assignmentsWithNoSubmissions {
    return assignments
        .where(
          (assignment) => assignment.submissions.every(
            (submission) =>
                !submission.isSubmitted || submission.submissionDate == null,
          ),
        )
        .toList();
  }

  void filterAssignmentsByClass(String classId) {
    if (classId.isEmpty) {
      filteredAssignments.assignAll(assignments);
    } else {
      filteredAssignments.assignAll(
        assignments.where((a) => a.classId == classId).toList(),
      );
    }
  }

  void filterAssignmentsBySubject(String subjectId) {
    if (subjectId.isEmpty) {
      filteredAssignments.assignAll(assignments);
    } else {
      filteredAssignments.assignAll(
        assignments.where((a) => a.subjectId == subjectId).toList(),
      );
    }
  }

  void filterAssignmentsByStatus(String status) {
    switch (status) {
      case 'submitted':
        filteredAssignments.assignAll(assignmentsWithSubmissions);
        break;
      case 'pending':
        filteredAssignments.assignAll(assignmentsPendingGrading);
        break;
      case 'no_submissions':
        filteredAssignments.assignAll(assignmentsWithNoSubmissions);
        break;
      default:
        filteredAssignments.assignAll(assignments);
    }
  }

  void addAssignment(Assignment assignment) {
    // Ensure the assignment is created by this teacher
    final newAssignment = assignment.copyWith(teacherId: loggedInTeacher.id);
    assignments.add(newAssignment);
    filteredAssignments.add(newAssignment);
  }

  void updateAssignment(Assignment updatedAssignment) {
    final index = assignments.indexWhere((a) => a.id == updatedAssignment.id);
    if (index != -1) {
      assignments[index] = updatedAssignment;
      final filteredIndex = filteredAssignments.indexWhere(
        (a) => a.id == updatedAssignment.id,
      );
      if (filteredIndex != -1) {
        filteredAssignments[filteredIndex] = updatedAssignment;
      }
    }
  }

  void deleteAssignment(String assignmentId) {
    assignments.removeWhere((a) => a.id == assignmentId);
    filteredAssignments.removeWhere((a) => a.id == assignmentId);
  }

  // ✅ Get assignment by ID (only if created by this teacher)
  Assignment? getAssignmentById(String assignmentId) {
    return assignments.firstWhereOrNull(
      (a) => a.id == assignmentId && a.teacherId == loggedInTeacher.id,
    );
  }

  List<AssignmentSubmission> getSubmissionsForAssignment(String assignmentId) {
    final assignment = getAssignmentById(assignmentId);
    return assignment?.submissions ?? [];
  }

  void updateSubmission(
    String assignmentId,
    AssignmentSubmission updatedSubmission,
  ) {
    final assignment = getAssignmentById(assignmentId);
    if (assignment != null) {
      final updatedSubmissions = List<AssignmentSubmission>.from(
        assignment.submissions,
      );
      final subIndex = updatedSubmissions.indexWhere(
        (s) => s.studentId == updatedSubmission.studentId,
      );

      if (subIndex != -1) {
        updatedSubmissions[subIndex] = updatedSubmission;
      } else {
        updatedSubmissions.add(updatedSubmission);
      }

      updateAssignment(assignment.copyWith(submissions: updatedSubmissions));
    }
  }

  void submitMarksAndFeedback({
    required String assignmentId,
    required String studentId,
    required int marksObtained,
    required String feedback,
  }) {
    final assignment = getAssignmentById(assignmentId);
    if (assignment == null) return;

    final updatedSubmissions = List<AssignmentSubmission>.from(
      assignment.submissions,
    );
    final submissionIndex = updatedSubmissions.indexWhere(
      (s) => s.studentId == studentId,
    );

    if (submissionIndex != -1) {
      updatedSubmissions[submissionIndex] = AssignmentSubmission(
        studentId: studentId,
        isSubmitted: true,
        submissionDate:
            updatedSubmissions[submissionIndex].submissionDate ??
            DateTime.now(),
        marksObtained: marksObtained,
        feedback: feedback,
        files: updatedSubmissions[submissionIndex].files,
      );

      updateAssignment(assignment.copyWith(submissions: updatedSubmissions));
    }
  }

  // Helper method to clear all form fields
  void clearForm() {
    titleController.clear();
    descriptionController.clear();
    totalMarksController.clear();
    obtainedmarksController.clear();
    feedbackController.clear();
    attachments.clear();
    dueDate.value = null;
    dueTime.value = null;
    isAssigned.value = false;
  }

  // ✅ Refresh assignments data
  void refreshAssignments() {
    _loadAssignmentData();
  }
}
