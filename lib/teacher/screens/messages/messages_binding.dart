import 'package:get/get.dart';
import 'package:school_app/teacher/screens/messages/messages_controller.dart';

class TeacherMessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherMessagesController());
  }
}
