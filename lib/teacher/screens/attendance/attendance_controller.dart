import 'dart:math';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/models/class.dart';
import 'package:school_app/common/models/teacher.dart';
import 'package:school_app/common/models/student.dart';

class AttendanceController extends GetxController {
  // Dependencies
  final AppBarController appBarController = Get.find<AppBarController>();
  final DrawerControllerCustom drawerController =
      Get.find<DrawerControllerCustom>();

  // State
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);

  final RxList<SchoolClass> allClasses = <SchoolClass>[].obs;
  final Rx<SchoolClass?> myClass = Rx<SchoolClass?>(
    null,
  ); // Only the class where teacher is class teacher
  final RxMap<String, String> attendanceStatus = <String, String>{}.obs;

  // Logged-in teacher
  late final Teacher loggedInTeacher;

  @override
  void onInit() {
    super.onInit();
    selectedDay.value = focusedDay.value;
    _initializeTeacher();
    _loadAllClasses();
    _findMyClass();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration.zero, () {
      appBarController.setTitle('Attendance');
      drawerController.setActiveIndex(2); // Index 2 for Attendance
    });
  }

  @override
  void onClose() {
    appBarController.setTitle('Dashboard');
    drawerController.setActiveIndex(0);
    super.onClose();
  }

  void _initializeTeacher() {
    loggedInTeacher = Teacher(
      id: '1',
      name: 'Mr. Ahmad',
      email: 'ahmad@example.com',
      avatarUrl: '',
      major: 'Mathematics',
    );
  }

  void _loadAllClasses() {
    // Create dummy students
    final students = [
      Student(
        id: 'S1',
        name: 'Student 1',
        email: 'student1@example.com',
        avatarUrl: '',
        enrollmentId: 'ENR001',
        grade: 'Grade 10',
      ),
      Student(
        id: 'S2',
        name: 'Student 2',
        email: 'student2@example.com',
        avatarUrl: '',
        enrollmentId: 'ENR002',
        grade: 'Grade 10',
      ),
      Student(
        id: 'S3',
        name: 'Student 3',
        email: 'student3@example.com',
        avatarUrl: '',
        enrollmentId: 'ENR003',
        grade: 'Grade 10',
      ),
    ];

    // Load all classes
    allClasses.assignAll([
      SchoolClass(
        id: '1',
        name: 'Class A',
        classTeacher: loggedInTeacher, // This teacher is the class teacher
        section: 'A',
        subjects: [],
        students: students,
      ),
      SchoolClass(
        id: '2',
        name: 'Class B',
        classTeacher: Teacher(
          id: '2',
          name: 'John Doe',
          avatarUrl: "",
          email: "john@example.com",
          major: "Science",
        ),
        section: 'B',
        subjects: [],
        students: [],
      ),
    ]);
  }

  void _findMyClass() {
    // Find the class where loggedInTeacher is the class teacher
    final myClassResult = allClasses.firstWhereOrNull(
      (classItem) => classItem.classTeacher.id == loggedInTeacher.id,
    );

    myClass.value = myClassResult;

    // Load attendance data if class found
    if (myClass.value != null && selectedDay.value != null) {
      _fetchAttendanceData(selectedDay.value!);
    }
  }

  void onDaySelected(DateTime newSelectedDay, DateTime newFocusedDay) {
    selectedDay.value = newSelectedDay;
    focusedDay.value = newFocusedDay;
    _fetchAttendanceData(newSelectedDay);
  }

  void _fetchAttendanceData(DateTime date) {
    // Simulate fetching attendance data
    if (myClass.value != null) {
      final attendanceData = {
        for (var student in myClass.value!.students)
          student.id: ['Present', 'Absent', 'Late', 'Not Marked'].randomElement,
      };
      attendanceStatus.assignAll(attendanceData);
    }
  }

  void updateAttendanceStatus(String studentId, String newStatus) {
    attendanceStatus[studentId] = newStatus;
  }

  void submitAttendance() {
    if (myClass.value != null) {
      print('Submitting Attendance for ${myClass.value!.name}');
      print(attendanceStatus);
    } else {}
  }

  // Helper method to get students
  List<Student> getStudents() {
    return myClass.value?.students ?? [];
  }

  // Helper method to get attendance status for a student
  String getAttendanceStatus(String studentId) {
    return attendanceStatus[studentId] ?? 'Not Marked';
  }
}

extension RandomElement<T> on List<T> {
  T get randomElement {
    final random = Random();
    return this[random.nextInt(length)];
  }
}

// Extension for firstWhereOrNull
extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
