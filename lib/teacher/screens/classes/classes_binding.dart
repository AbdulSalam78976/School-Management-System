import 'package:get/get.dart';
import 'package:school_app/teacher/screens/classes/classes_controller.dart';

class ClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherClassesController());
  }
}
