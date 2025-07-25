import 'package:get/get.dart';
import 'package:school_app/common/screens/announcements%20screen/announcements_controller.dart';

class AnnouncementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnouncementsController());
  }
}
