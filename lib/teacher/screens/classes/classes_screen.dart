import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/class/class_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/teacher/screens/classes/classes_controller.dart';

class TeacherClassesScreen extends StatefulWidget {
  const TeacherClassesScreen({super.key});

  @override
  State<TeacherClassesScreen> createState() => _TeacherClassesScreenState();
}

class _TeacherClassesScreenState extends State<TeacherClassesScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherClassesController>();
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Expanded(
          child: Obx(
            () => GridView.builder(
              itemCount: controller.classes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final classData = controller.classes[index];
                return ClassCard(
                  title: classData.name,
                  studentCount: classData.students.length,
                  section: classData.section,
                  subject: classData.subject,
                  onTap: () {},
                  onAssignmentTap: () {
                    // Handle assignment tap
                    Get.toNamed(
                      RouteName.teacherAssignmentScreen,
                      arguments: {
                        'classId': classData.id,
                        'teacherId': classData.id,
                      },
                    );
                  },
                  onGradeTap: () {},
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
