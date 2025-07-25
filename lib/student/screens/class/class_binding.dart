import 'package:get/get.dart';
import 'package:school_app/student/screens/class/class_controller.dart';

class ClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassController());
  }
}
