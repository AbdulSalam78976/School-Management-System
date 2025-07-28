import 'package:get/get.dart';
import 'package:school_app/common/components/announcements/announcements_controller.dart';
import 'package:school_app/common/components/greetingcard/greeting_controller.dart';
import 'package:school_app/common/components/quick%20action%20cards/quick_action_card_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GreetingController());
    Get.lazyPut(() => QuickActionCardController());
    Get.lazyPut(() => AnnouncementController());
  }
}
