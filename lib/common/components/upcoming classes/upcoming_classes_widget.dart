import 'package:flutter/material.dart';
import 'package:school_app/common/components/section_header_with_action.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_class_tile.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_data.dart';

class UpcomingClassesWidget extends StatelessWidget {
  const UpcomingClassesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final upcomingClasses = UpcomingClassesData();
    return Column(
      children: [
        SectionHeaderWithAction(
          title: 'Upcoming Classes',
          onTap: () {
            // Navigate to full class list
          },
        ),
        SizedBox(height: 10),
        // List of upcoming classes
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: upcomingClasses.upcomingClasses.length >= 3
              ? 3
              : upcomingClasses.upcomingClasses.length,
          itemBuilder: (context, index) {
            final upcomingClass = upcomingClasses.upcomingClasses[index];
            return UpcomingClassTile(
              time: upcomingClass.time,
              subject: upcomingClass.subject,
              grade: upcomingClass.grade,
            );
          },
        ),
      ],
    );
  }
}
