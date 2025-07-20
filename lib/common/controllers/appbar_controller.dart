import 'package:get/get.dart';

class AppBarController extends GetxController {
  final RxString title = ''.obs;
  final RxInt notificationCount = 0.obs;
  final RxString profileImage = ''.obs;

  void setTitle(String newTitle) {
    title.value = newTitle;
  }

  void setNotificationCount(int count) {
    notificationCount.value = count;
  }

  void setProfileImage(String imagePath) {
    profileImage.value = imagePath;
  }
}
