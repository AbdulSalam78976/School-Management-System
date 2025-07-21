import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/section_header_with_action.dart';
import 'package:school_app/common/components/upcoming classes/upcoming_class_tile.dart';
import 'upcoming_classes_controller.dart';

class UpcomingClassesWidget extends StatelessWidget {
  const UpcomingClassesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UpcomingClassesController controller = Get.put(
      UpcomingClassesController(),
    );
    return Column(
      children: [
        SectionHeaderWithAction(
          title: 'Upcoming Classes',
          onTap: () {
            // Navigate to full class list
          },
        ),
        const SizedBox(height: 10),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.upcomingClasses.length >= 3
                ? 3
                : controller.upcomingClasses.length,
            itemBuilder: (context, index) {
              final upcomingClass = controller.upcomingClasses[index];
              return UpcomingClassTile(
                time: upcomingClass.time,
                subject: upcomingClass.subject,
                grade: upcomingClass.grade,
              );
            },
          ),
        ),
      ],
    );
  }
}
