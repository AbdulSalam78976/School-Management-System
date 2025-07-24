import 'package:get/get.dart';
import 'package:school_app/common/screens/settings/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
