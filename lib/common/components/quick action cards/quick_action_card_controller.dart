import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'quick_action_card_model.dart';

class QuickActionCardController extends GetxController {
  final RxList<QuickActionCardModel> quickActions =
      <QuickActionCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    quickActions.assignAll([
      QuickActionCardModel(
        label: "Classes",
        icon: Icons.class_outlined,
        onTap: () {},
      ),
      QuickActionCardModel(
        label: "Attendance",
        icon: Icons.calendar_today_outlined,
        onTap: () {},
      ),
      QuickActionCardModel(
        label: "Timetable",
        icon: Icons.watch_later_outlined,
        onTap: () {},
      ),
      QuickActionCardModel(
        label: "Results",
        icon: Icons.grade_outlined,
        onTap: () {},
      ),
    ]);
  }

  void addAction(QuickActionCardModel action) {
    quickActions.add(action);
  }

  void removeAction(int index) {
    quickActions.removeAt(index);
  }

  void updateAction(int index, QuickActionCardModel action) {
    quickActions[index] = action;
  }

  void setQuickActions(List<QuickActionCardModel> actions) {
    quickActions.assignAll(actions);
  }
}
