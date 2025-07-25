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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Obx(
            () => GridView.builder(
              itemCount: controller.filteredclasses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final classData = controller.filteredclasses[index];
                return ClassCard(
                  title: classData.name,
                  studentCount: classData.students.length,
                  section: classData.section,
                  subject: classData.subjects
                      .where(
                        (subject) =>
                            subject.teacher.id == controller.loggedInTeacher.id,
                      )
                      .first
                      .name,
                  onTap: () {
                    Get.toNamed(
                      RouteName.teacherClassDetailScreen,
                      arguments: classData,
                    );
                  },
                  onAssignmentTap: () {
                    Get.toNamed(
                      RouteName.teacherAssignmentScreen,
                      arguments: classData,
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
