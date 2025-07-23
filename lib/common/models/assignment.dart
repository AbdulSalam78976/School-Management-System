import 'package:file_picker/file_picker.dart';

class AssignmentSubmission {
  final String studentId;
  bool isSubmitted;
  DateTime? submissionDate;
  num? marksObtained;

  AssignmentSubmission({
    required this.studentId,
    this.isSubmitted = false,
    this.submissionDate,
    this.marksObtained,
  });
}

class Assignment {
  final String id;
  final String title;
  final String description;
  final String classId; // To link with Class
  final String subject;
  final int totalMarks;
  final DateTime assignedDate;
  final DateTime? assignedTime;
  final DateTime? dueDate;
  final DateTime? dueTime;
  final String teacherId; // Creator/Owner of assignment
  final List<PlatformFile>? attachments; // File URLs or paths
  final bool isSubmitted; // If current user submitted
  final DateTime? submissionDate;
  final List<AssignmentSubmission> submissions;

  final String? feedback; // Optional teacher feedback

  Assignment({
    required this.id,
    required this.title,
    required this.description,
    required this.classId,
    required this.subject,
    required this.assignedDate,
    required this.dueDate,
    required this.dueTime,
    required this.teacherId,
    required this.totalMarks,
    this.attachments,
    this.isSubmitted = false,
    this.submissionDate,
    this.feedback,
    required this.assignedTime,
    this.submissions = const [],
  });
}
