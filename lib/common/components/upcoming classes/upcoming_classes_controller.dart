import 'package:get/get.dart';
import 'upcoming_classes_model.dart';

class UpcomingClassesController extends GetxController {
  final RxList<UpcomingClassesModel> upcomingClasses =
      <UpcomingClassesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    upcomingClasses.assignAll([
      UpcomingClassesModel(
        time: "10:00 AM-11:00 AM",
        subject: "English",
        grade: "Grade 5",
      ),
      UpcomingClassesModel(
        time: "12:00 PM-1:00 PM",
        subject: "Urdu",
        grade: "Grade 10",
      ),
      UpcomingClassesModel(
        time: "02:00 PM-03:00 PM",
        subject: "Math",
        grade: "Grade 8",
      ),
      UpcomingClassesModel(
        time: "08:00 PM-09:00 PM",
        subject: "English",
        grade: "Grade 5",
      ),
    ]);
  }

  void setUpcomingClasses(List<UpcomingClassesModel> classes) {
    upcomingClasses.assignAll(classes);
  }

  void addUpcomingClass(UpcomingClassesModel upcomingClass) {
    upcomingClasses.add(upcomingClass);
  }

  void removeUpcomingClass(int index) {
    upcomingClasses.removeAt(index);
  }
}
