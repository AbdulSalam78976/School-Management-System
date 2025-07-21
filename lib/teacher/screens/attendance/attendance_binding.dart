import 'package:get/get.dart';
import 'package:school_app/teacher/screens/attendance/attendance_controller.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceController());
  }
}
