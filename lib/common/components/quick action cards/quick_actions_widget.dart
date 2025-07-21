import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'quick_action_card_controller.dart';
import 'quick_action_card_widget.dart';
import 'package:school_app/common/components/section_header_with_action.dart';

class QuickActionsWidget extends StatelessWidget {
  QuickActionsWidget({Key? key}) : super(key: key);

  final QuickActionCardController controller = Get.put(
    QuickActionCardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWithAction(title: 'Quick Actions'),
        Obx(
          () => GridView.builder(
            itemCount: controller.quickActions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              final item = controller.quickActions[index];
              return QuickActionCard(
                label: item.label,
                icon: item.icon,
                onTap: item.onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
