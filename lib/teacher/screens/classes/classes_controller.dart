import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/class.dart';
import 'package:school_app/common/models/subject.dart';
import 'package:school_app/common/models/teacher.dart';

class TeacherClassesController extends GetxController {
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  final RxList<SchoolClass> classes = <SchoolClass>[].obs;
  final RxList<SchoolClass> filteredclasses = <SchoolClass>[].obs;

  late final Teacher loggedInTeacher;

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

    // loggedInTeacher = getLoggedInTeacher();
    //fetchTeacherClasses()

    // Hardcoded teacher for testing
    loggedInTeacher = Teacher(
      id: 't1',
      name: 'Mr. John',
      avatarUrl: '',
      email: '',
      major: '',
    );

    // Hardcoded class with one subject and the teacher
    final testClass = SchoolClass(
      id: 'c1',
      name: 'Grade 8 ',
      classTeacher: loggedInTeacher,
      subjects: [Subject(id: 's1', name: 'Math', teacher: loggedInTeacher)],
      section: 'A',
      students: [],
    );

    filteredclasses.assignAll([testClass]); // Assign just this hardcoded class

    // Later, you can replace this with: fetchTeacherClasses();
  }

  List<SchoolClass> getClassesForTeacher() {
    return classes.where((schoolClass) {
      final isSubjectTeacher = schoolClass.subjects.any(
        (subject) => subject.teacher.id == loggedInTeacher.id,
      );
      final isClassTeacher = schoolClass.classTeacher.id == loggedInTeacher.id;
      return isSubjectTeacher || isClassTeacher;
    }).toList();
  }

  // void fetchTeacherClasses() {
  //   // Assuming `allClasses` is your full list of classes
  //   final allClasses = getAllSchoolClasses(); // Replace with actual source

  //   final filteredClasses = allClasses.where((schoolClass) {
  //     final isSubjectTeacher = schoolClass.subjects.any(
  //       (subject) => subject.teacher.id == loggedInTeacher.id,
  //     );
  //     final isClassTeacher = schoolClass.classTeacher?.id == loggedInTeacher.id;
  //     return isSubjectTeacher || isClassTeacher;
  //   }).toList();

  //   classes.assignAll(filteredClasses);
  // }
}
