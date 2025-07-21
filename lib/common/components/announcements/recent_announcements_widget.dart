import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/announcements/announcements_controller.dart';
import 'package:school_app/common/components/announcements/announcements_tile.dart';
import 'package:school_app/common/components/section_header_with_action.dart';

class AnnouncementsWidget extends StatelessWidget {
  const AnnouncementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AnnouncementsController controller = Get.put(
      AnnouncementsController(),
    );
    return Column(
      children: [
        SectionHeaderWithAction(title: 'Recent Announcements', onTap: () {}),
        const SizedBox(height: 10),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.announcements.length >= 3
                ? 3
                : controller.announcements.length,
            itemBuilder: (context, index) {
              final announcement = controller.announcements[index];
              return AnnouncementsTile(announcement: announcement);
            },
          ),
        ),
      ],
    );
  }
}
