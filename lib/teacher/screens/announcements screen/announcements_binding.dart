import 'package:get/get.dart';
import 'package:school_app/teacher/screens/announcements%20screen/announcements_controller.dart';

class TeacherAnnouncementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherAnnouncementsController());
  }
}
