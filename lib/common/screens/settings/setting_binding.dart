import 'package:get/get.dart';
import 'package:school_app/common/screens/settings/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherSettingController());
  }
}
