import 'package:get/get.dart';
import 'announcements_model.dart';

class AnnouncementController extends GetxController {
  final RxList<AnnouncementsModel> announcements = <AnnouncementsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some default data
    announcements.assignAll([
      AnnouncementsModel(
        title: 'Parent-Teacher Meeting',
        date: '2 days ago',
        description: 'A parent-teacher meeting will be held this Saturday.',
      ),
      AnnouncementsModel(
        title: 'Sports Day',
        date: 'Last week',
        description:
            'Annual sports day is scheduled for next week. Participation is encouraged.',
      ),
      AnnouncementsModel(
        title: 'Holiday Announcement',
        date: 'Yesterday',
        description:
            'School will be closed next Monday due to a public holiday.',
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
