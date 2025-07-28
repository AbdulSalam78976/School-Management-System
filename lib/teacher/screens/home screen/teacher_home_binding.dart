import 'package:get/get.dart';
import 'package:school_app/common/components/announcements/announcements_controller.dart';
import 'package:school_app/common/components/greetingcard/greeting_controller.dart';
import 'package:school_app/common/components/quick%20action%20cards/quick_action_card_controller.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_controller.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuickActionCardController());
    Get.lazyPut(() => UpcomingClassesController());
    Get.lazyPut(() => AnnouncementController());
    Get.lazyPut(() => GreetingController());
  }
}
