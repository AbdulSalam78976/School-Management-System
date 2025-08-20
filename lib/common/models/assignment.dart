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

  Assignment copyWith({
    String? id,
    String? title,
    String? description,
    String? classId,
    String? subjectId,
    int? totalMarks,
    DateTime? assignedDate,
    DateTime? assignedTime,
    DateTime? dueDate,
    DateTime? dueTime,
    String? teacherId,
    List<PlatformFile>? attachments,
    bool? isSubmitted,
    DateTime? submissionDate,
    List<AssignmentSubmission>? submissions,
  }) {
    return Assignment(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      classId: classId ?? this.classId,
      subjectId: subjectId ?? this.subjectId,
      totalMarks: totalMarks ?? this.totalMarks,
      assignedDate: assignedDate ?? this.assignedDate,
      assignedTime: assignedTime ?? this.assignedTime,
      dueDate: dueDate ?? this.dueDate,
      dueTime: dueTime ?? this.dueTime,
      teacherId: teacherId ?? this.teacherId,
      attachments: attachments ?? this.attachments,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      submissionDate: submissionDate ?? this.submissionDate,
      submissions: submissions ?? this.submissions,
    );
  }
}
