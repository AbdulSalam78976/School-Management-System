import 'package:get/get.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_controller.dart';

class AssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherAssignmentController());
  }
}
