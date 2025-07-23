import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/class.dart';
import 'package:school_app/common/models/student.dart';
import 'package:school_app/common/models/teacher.dart';

class TeacherClassesController extends GetxController {
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  final RxList<Class> classes = <Class>[].obs;

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

  @override
  void onInit() {
    super.onInit();
    _loadClassData();
  }

  void setClasses(List<Class> newClasses) {
    classes.assignAll(newClasses);
  }

  void addClass(Class newClass) {
    classes.add(newClass);
  }

  void _loadClassData() {
    // This would typically be an API call.
    // For now, we'll use mock data.

    classes.assignAll([
      Class(
        id: '1',
        name: 'Class XI',
        section: 'A',
        teacher: Teacher(
          id: '1',
          name: '',
          avatarUrl: '',
          major: "Bio",
          subjects: [],
        ),
        students: [
          Student(
            id: '1',
            name: 'Student 1',
            avatarUrl: '',
            enrollmentId: '',
            grade: '',
          ),
          Student(
            id: '2',
            name: 'Student 2',
            avatarUrl: '',
            enrollmentId: '',
            grade: '',
          ),
          // Add more students...
        ],
        subject: 'Physics',
      ),

      // Add more classes...
    ]);
  }
}
