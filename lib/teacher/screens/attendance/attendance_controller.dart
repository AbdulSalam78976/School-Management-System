import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/class.dart';
import 'package:school_app/common/models/student.dart';
import 'package:school_app/common/models/teacher.dart';

class AttendanceController extends GetxController {
  // Dependencies
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  // State
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  final RxInt selectedClassIndex = 0.obs;

  final RxList<SchoolClass> classes = <SchoolClass>[].obs;
  final RxList<SchoolClass> filteredclasses = <SchoolClass>[].obs;
  final RxMap<String, String> attendanceStatus = <String, String>{}.obs;

  late final loggedInTeacher;

  @override
  void onInit() {
    super.onInit();
    selectedDay.value = focusedDay.value;
    //loggedInTeacher = getLoggedInTeacher();
    filterClassesByTeacher();
    //_loadClassData();
  }

  @override
  void onReady() {
    super.onReady();
    // Use a microtask to safely update shared state after the frame is drawn.
    Future.delayed(Duration.zero, () {
      appBarController.setTitle('Attendance');
      drawerController.setActiveIndex(2); // Index 2 for Attendance
    });
  }

  @override
  void onClose() {
    // Reset the shared state when the screen is closed.
    appBarController.setTitle('Dashboard');
    drawerController.setActiveIndex(0);
    super.onClose();
  }

  void onDaySelected(DateTime newSelectedDay, DateTime newFocusedDay) {
    selectedDay.value = newSelectedDay;
    focusedDay.value = newFocusedDay;

    // Make API call to fetch attendance data for the new date
    _fetchAttendanceData(newSelectedDay);
  }

  void _fetchAttendanceData(DateTime date) {
    // Replace this with your actual API call or data retrieval logic
    // For example:
    // final response = await http.get(Uri.parse('https://your-api.com/attendance/${date.toString()}'));
    // final attendanceData = jsonDecode(response.body);

    // Update your attendanceStatus map with the new data
    // attendanceStatus.assignAll(attendanceData);
  }

  void selectClass(int index) {
    selectedClassIndex.value = index;
  }

  void updateAttendanceStatus(String studentId, String newStatus) {
    attendanceStatus[studentId] = newStatus;
  }

  void submitAttendance() {
    final selectedClass = classes[selectedClassIndex.value];
    print('Submitting Attendance for ${selectedClass.name}');
    print(attendanceStatus);
    Get.snackbar(
      'Success',
      'Attendance for ${selectedClass.name} submitted successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void filterClassesByTeacher() {
    filteredclasses.assignAll(
      classes
          .where(
            (c) =>
                c.subjects.any(
                  (subject) => subject.teacher.id == loggedInTeacher.id,
                ) ||
                c.classTeacher.id == loggedInTeacher.id,
          )
          .toList(),
    );
  }
}
