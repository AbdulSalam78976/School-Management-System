import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class AssignmentUploadController extends GetxController {
  // Reactive variables
  final RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;
  final RxBool isUploading = false.obs;
  final RxString uploadStatus = ''.obs;

  // Controllers for form fields
  final TextEditingController feedbackController = TextEditingController();

  // Assignment details
  final RxString assignmentTitle = ''.obs;
  final RxString assignmentDescription = ''.obs;
  final Rx<DateTime> dueDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    _loadAssignmentDetails();
  }

  void _loadAssignmentDetails() {
    // Get assignment details from arguments
    final arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      assignmentTitle.value = arguments['assignmentTitle'] ?? 'Assignment';
      assignmentDescription.value =
          arguments['assignmentDescription'] ??
          'Complete the assignment and submit your work.';
      dueDate.value =
          arguments['dueDate'] ?? DateTime.now().add(Duration(days: 7));
    }
  }

  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png', 'txt'],
      );

      if (result != null) {
        selectedFiles.addAll(result.files);
        uploadStatus.value = '${result.files.length} file(s) selected';
      }
    } catch (e) {
      uploadStatus.value = 'Error picking files: $e';
      Get.snackbar(
        'Error',
        'Failed to pick files: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void removeFile(int index) {
    if (index >= 0 && index < selectedFiles.length) {
      selectedFiles.removeAt(index);
      uploadStatus.value = '${selectedFiles.length} file(s) selected';
    }
  }

  Future<void> submitAssignment() async {
    if (selectedFiles.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select at least one file to submit',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    isUploading.value = true;
    uploadStatus.value = 'Uploading files...';

    try {
      // Simulate upload process
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Implement actual file upload logic here
      // For now, we'll just simulate success

      uploadStatus.value = 'Upload successful!';
      Get.snackbar(
        'Success',
        'Assignment submitted successfully! ${selectedFiles.length} file(s) uploaded.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Clear files after successful upload
      selectedFiles.clear();

      // Navigate back
      Get.back();
    } catch (e) {
      uploadStatus.value = 'Upload failed: $e';
      Get.snackbar(
        'Error',
        'Failed to upload assignment: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isUploading.value = false;
    }
  }

  String getFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Color getFileIconColor(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
        return Colors.blue;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Colors.green;
      case 'txt':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  IconData getFileIcon(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      case 'txt':
        return Icons.text_snippet;
      default:
        return Icons.insert_drive_file;
    }
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}
