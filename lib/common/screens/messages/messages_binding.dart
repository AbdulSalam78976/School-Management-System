import 'package:get/get.dart';
import 'package:school_app/common/screens/messages/messages_controller.dart';

class MessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesController());
  }
}
