import 'package:get/get.dart';

class TeacherDashboardController extends GetxController {
  var activeDrawerIndex = 0.obs;

  void setActiveIndex(int index) {
    activeDrawerIndex.value = index;
  }
}
