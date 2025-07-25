import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/subject.dart';

class ClassController extends GetxController {
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  final RxList<Subject> subjects = <Subject>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Use a microtask to safely update shared state after the frame is drawn.
    Future.delayed(Duration.zero, () {
      appBarController.setTitle('Class');
      drawerController.setActiveIndex(1);
    });
  }

  @override
  void onClose() {
    // Reset the shared state when the screen is closed.
    appBarController.setTitle('Dashboard');
    drawerController.setActiveIndex(0);
    super.onClose();
  }
}
