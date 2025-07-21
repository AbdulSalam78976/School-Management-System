import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppBarController(), permanent: true);
    Get.put(DrawerControllerCustom(), permanent: true);
  }
}
