import 'package:file_picker/file_picker.dart';

class AssignmentSubmission {
  final String studentId;
  bool isSubmitted;
  DateTime? submissionDate;
  int? marksObtained;
  List<PlatformFile> files;
  String? feedback;

  AssignmentSubmission({
    required this.studentId,
    this.isSubmitted = false,
    this.submissionDate,
    this.marksObtained,
    this.files = const [],
    this.feedback,
  });
}

class Assignment {
  final String id;
  final String title;
  final String description;
  final String classId; // To link with SchoolClass
  final String subjectId; // Link to Subject (should ideally be ID)
  final int totalMarks;
  final DateTime assignedDate;
  final DateTime assignedTime;
  final DateTime? dueDate;
  final DateTime? dueTime;
  final String teacherId; // Creator of assignment
  final List<PlatformFile>? attachments;
  final bool isSubmitted; // Whether current student submitted
  final DateTime? submissionDate;
  final List<AssignmentSubmission> submissions;

  Assignment({
    required this.id,
    required this.title,
    required this.description,
    required this.classId,
    required this.subjectId,
    required this.totalMarks,
    required this.assignedDate,
    required this.assignedTime,
    this.dueDate,
    this.dueTime,
    required this.teacherId,
    this.attachments,
    this.isSubmitted = false,
    this.submissionDate,
    this.submissions = const [],
  });
}
