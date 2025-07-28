import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/subject.dart';
import 'package:school_app/common/models/teacher.dart';

class ClassController extends GetxController {
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  // Reactive variables
  final RxList<Subject> subjects = <Subject>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSubjects();
  }

  @override
  void onReady() {
    super.onReady();
    // Use a microtask to safely update shared state after the frame is drawn.
    Future.delayed(Duration.zero, () {
      appBarController.setTitle('Classes');
      drawerController.setActiveIndex(1);
    });
  }

  @override
  void onClose() {
    // Reset the shared state when the screen is closed.
    appBarController.setTitle('Dashboard');
    drawerController.setActiveIndex(0);
    super.onClose();
  }

  Future<void> _loadSubjects() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock data - in real app, this would come from API
      final mockSubjects = [
        Subject(
          id: '1',
          name: 'Mathematics',
          teacher: Teacher(
            id: 't1',
            name: 'Mr. John Doe',
            avatarUrl: 'https://example.com/teacher1.jpg',
            email: 'john.doe@school.com',
            major: 'Mathematics',
          ),
        ),
        Subject(
          id: '2',
          name: 'Physics',
          teacher: Teacher(
            id: 't2',
            name: 'Ms. Sarah Khan',
            avatarUrl: 'https://example.com/teacher2.jpg',
            email: 'sarah.khan@school.com',
            major: 'Physics',
          ),
        ),
        Subject(
          id: '3',
          name: 'Chemistry',
          teacher: Teacher(
            id: 't3',
            name: 'Dr. Michael Chen',
            avatarUrl: 'https://example.com/teacher3.jpg',
            email: 'michael.chen@school.com',
            major: 'Chemistry',
          ),
        ),
        Subject(
          id: '4',
          name: 'English Literature',
          teacher: Teacher(
            id: 't4',
            name: 'Mrs. Emily Wilson',
            avatarUrl: 'https://example.com/teacher4.jpg',
            email: 'emily.wilson@school.com',
            major: 'English',
          ),
        ),
      ];

      subjects.assignAll(mockSubjects);
    } catch (e) {
      errorMessage.value = 'Failed to load subjects: $e';
      Get.snackbar(
        'Error',
        'Failed to load subjects',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshSubjects() async {
    await _loadSubjects();
  }

  Subject? getSubjectById(String id) {
    try {
      return subjects.firstWhere((subject) => subject.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Subject> searchSubjects(String query) {
    if (query.isEmpty) return subjects;

    return subjects
        .where(
          (subject) =>
              subject.name.toLowerCase().contains(query.toLowerCase()) ||
              subject.teacher.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  void navigateToClassDetail(Subject subject) {
    Get.toNamed('/class_detail_Screen', arguments: subject);
  }

  void navigateToAssignmentUpload(Subject subject, String assignmentTitle) {
    Get.toNamed(
      '/assignment_upload_Screen',
      arguments: {
        'assignmentTitle': assignmentTitle,
        'assignmentDescription':
            'Complete the assignment and submit your work.',
        'dueDate': DateTime.now().add(Duration(days: 7)),
      },
    );
  }
}
