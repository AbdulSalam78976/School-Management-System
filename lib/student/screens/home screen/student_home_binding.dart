import 'package:get/get.dart';
import 'package:school_app/common/components/greetingcard/greeting_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GreetingController());
  }
}
