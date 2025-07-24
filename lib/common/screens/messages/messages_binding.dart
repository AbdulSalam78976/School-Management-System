import 'package:get/get.dart';
import 'package:school_app/common/screens/messages/messages_controller.dart';

class TeacherMessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherMessagesController());
  }
}
