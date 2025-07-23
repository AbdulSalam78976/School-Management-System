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

  final RxList<Class> classData = <Class>[].obs;
  final RxMap<String, String> attendanceStatus = <String, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    selectedDay.value = focusedDay.value;
    _loadClassData();
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
    print('Submitting Attendance: $attendanceStatus');
    Get.snackbar(
      'Success',
      'Attendance has been updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _loadClassData() {
    // This would typically be an API call.
    // For now, we'll use the same mock data.
    classData.assignAll([
      Class(
        id: 'C01',
        name: 'All Classes',
        section: 'A',
        subject: 'Various',
        teacher: Teacher(
          id: 'T01',
          name: 'Ms. Harper',
          avatarUrl: '',
          major: '',
          subjects: [],
        ),
        students: [
          Student(
            id: '1',
            name: 'Ethan Harper',
            avatarUrl: 'assets/ethan.png',
            enrollmentId: 'S001',
            grade: '10',
          ),
          Student(
            id: '2',
            name: 'Olivia Bennett',
            avatarUrl: 'assets/olivia.png',
            enrollmentId: 'S002',
            grade: '10',
          ),
          Student(
            id: '3',
            name: 'Noah Carter',
            avatarUrl: 'assets/noah.png',
            enrollmentId: 'S003',
            grade: '10',
          ),
          Student(
            id: '4',
            name: 'Ava Mitchell',
            avatarUrl: 'assets/ava.png',
            enrollmentId: 'S004',
            grade: '10',
          ),
          Student(
            id: '5',
            name: 'Liam Foster',
            avatarUrl: 'assets/liam.png',
            enrollmentId: 'S005',
            grade: '10',
          ),
          Student(
            id: '6',
            name: 'Isabella Hayes',
            avatarUrl: 'assets/isabella.png',
            enrollmentId: 'S006',
            grade: '10',
          ),
        ],
      ),
      Class(
        id: 'C02',
        name: 'Math 101',
        section: 'A',
        subject: 'Mathematics',
        teacher: Teacher(
          id: 'T01',
          name: 'Ms. Harper',
          avatarUrl: '',
          major: 'Math',
          subjects: ['Math'],
        ),
        students: [
          Student(
            id: '1',
            name: 'Ethan Harper',
            avatarUrl: 'assets/ethan.png',
            enrollmentId: 'S001',
            grade: '10',
          ),
          Student(
            id: '3',
            name: 'Noah Carter',
            avatarUrl: 'assets/noah.png',
            enrollmentId: 'S003',
            grade: '10',
          ),
        ],
      ),
      Class(
        id: 'C03',
        name: 'Science 202',
        section: 'B',
        subject: 'Science',
        teacher: Teacher(
          id: 'T02',
          name: 'Mr. Davison',
          avatarUrl: '',
          major: 'Science',
          subjects: ['Science'],
        ),
        students: [
          Student(
            id: '2',
            name: 'Olivia Bennett',
            avatarUrl: 'assets/olivia.png',
            enrollmentId: 'S002',
            grade: '10',
          ),
          Student(
            id: '4',
            name: 'Ava Mitchell',
            avatarUrl: 'assets/ava.png',
            enrollmentId: 'S004',
            grade: '10',
          ),
        ],
      ),
    ]);

    attendanceStatus.value = {
      '1': 'Present',
      '2': 'Absent',
      '3': 'Present',
      '4': 'Leave',
      '5': 'Present',
      '6': 'Absent',
    };
  }
}
