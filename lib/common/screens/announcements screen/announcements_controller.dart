import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/components/announcements/announcements_model.dart';

class AnnouncementsController extends GetxController {
  // Dependencies
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  // State
  final RxList<AnnouncementsModel> announcements = <AnnouncementsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadAnnouncements();
  }

  @override
  void onReady() {
    super.onReady();
    // Use a microtask to safely update shared state after the frame is drawn.
    Future.delayed(Duration.zero, () {
      appBarController.setTitle('Announcements');
      drawerController.setActiveIndex(4); // Index 5 for Announcements
    });
  }

  @override
  void onClose() {
    // Reset the shared state when the screen is closed.
    appBarController.setTitle('Dashboard');
    drawerController.setActiveIndex(0);
    super.onClose();
  }

  void _loadAnnouncements() {
    // This would typically be an API call.
    // For now, we'll use mock data.
    announcements.assignAll([
      AnnouncementsModel(
        title: 'Staff Meeting',
        date: 'Tomorrow',
        description:
            'A mandatory staff meeting is scheduled for tomorrow at 10 AM in the main hall.',
      ),
      AnnouncementsModel(
        title: 'Report Card Distribution',
        date: 'Next Friday',
        description:
            'Please prepare and submit all student report cards by next Wednesday.',
      ),
      AnnouncementsModel(
        title: 'Curriculum Update',
        date: '2 weeks ago',
        description:
            'The new curriculum guidelines for the next semester have been released.',
      ),
    ]);
  }

  void setAnnouncements(List<AnnouncementsModel> newAnnouncements) {
    announcements.assignAll(newAnnouncements);
  }

  void addAnnouncement(AnnouncementsModel announcement) {
    announcements.add(announcement);
  }
}
