import 'package:get/get.dart';
import 'package:school_app/student/screens/class/assignment_upload_controller.dart';

class AssignmentUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssignmentUploadController());
  }
}
