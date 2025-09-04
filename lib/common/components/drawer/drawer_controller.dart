import 'package:get/get.dart';
import 'package:school_app/common/components/drawer/drawer_model.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/utils/sessionmanager.dart';

class DrawerControllerCustom extends GetxController {
  final RxString userName = ''.obs;
  final RxString userProfileImage = ''.obs;
  final RxList<DrawerModel> items = <DrawerModel>[].obs;
  final RxInt activeIndex = 0.obs;

  void setUserName(String name) {
    userName.value = name;
  }

  void setUserProfileImage(String imagePath) {
    userProfileImage.value = imagePath;
  }

  void setItems(List<DrawerModel> drawerItems) {
    items.assignAll(drawerItems);
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
    for (int i = 0; i < items.length; i++) {
      items[i] = items[i].copyWith(isActive: i == index);
    }
  }

  void logout() {
    SessionManager.clearToken().then(
      (value) => Get.offNamed(RouteName.loginScreen),
    );
  }
}
