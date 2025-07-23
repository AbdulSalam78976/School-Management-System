import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_controller.dart';

class AssignmentSubmissionDetailScreen extends StatefulWidget {
  const AssignmentSubmissionDetailScreen({super.key});

  @override
  State<AssignmentSubmissionDetailScreen> createState() =>
      _AssignmentSubmissionDetailScreenState();
}

class _AssignmentSubmissionDetailScreenState
    extends State<AssignmentSubmissionDetailScreen> {
  late String assignmentId;
  late String studentId;
  late String classId;
  @override
  void initState() {
    super.initState();
    classId = Get.arguments['classId'] ?? '';
    assignmentId = Get.arguments['assignmentId'] ?? '';
    studentId = Get.arguments['studentId'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherAssignmentController>();

    final List<PlatformFile> files = [
      PlatformFile(
        name: 'assignment_image.png',
        path: 'assets/images/biology.png',
        size: 12345,
      ),
      PlatformFile(
        name: 'assignment_report.pdf',
        path: 'assets/files/report.pdf',
        size: 23456,
      ),
    ];

    Widget buildFileTile(PlatformFile file) {
      final isImage =
          (file.extension?.toLowerCase() == 'png' ||
          file.extension?.toLowerCase() == 'jpg' ||
          file.extension?.toLowerCase() == 'jpeg');
      final isPdf = file.extension?.toLowerCase() == 'pdf';
      if (isImage) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(file.path!, fit: BoxFit.contain),
          ),
        );
      } else if (isPdf) {
        return ListTile(
          leading: const Icon(
            Icons.picture_as_pdf,
            color: Colors.red,
            size: 36,
          ),
          title: Text(file.name),
          onTap: () {
            // Open PDF logic here
            Get.snackbar('Open PDF', 'Would open: ' + file.name);
          },
        );
      } else {
        return ListTile(
          leading: const Icon(
            Icons.insert_drive_file,
            color: Colors.blue,
            size: 36,
          ),
          title: Text(file.name),
          onTap: () {
            // Open file logic here
            Get.snackbar('Open File', 'Would open: ' + file.name);
          },
        );
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Text(
            'Submitted Work',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 16),
          if (files.isEmpty)
            Container(
              height: 120,
              alignment: Alignment.center,
              child: const Text('No files submitted.'),
            )
          else
            ...files.map(buildFileTile),
          const SizedBox(height: 32),
          const Text(
            'Marks & Feedback',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 18),
          const Text(
            'Marks',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.obtainedmarksController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter marks',
              filled: true,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Feedback',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.feedbackController,
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Provide feedback to the student',
              filled: true,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                elevation: 0,
              ),
              onPressed: () {
                controller.submitMarksAndFeedback(
                  assignmentId: '',
                  studentId: '',
                );
                Get.snackbar('Submitted', 'Marks & feedback submitted!');
              },

              child: const Text('Submit Marks & Feedback'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
