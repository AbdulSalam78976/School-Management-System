import 'package:get/get.dart';

class StudentDashboardController extends GetxController {
  var activeDrawerIndex = 0.obs;

  void setActiveIndex(int index) {
    activeDrawerIndex.value = index;
  }
}
