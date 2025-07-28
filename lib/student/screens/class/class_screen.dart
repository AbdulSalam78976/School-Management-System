import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/components/loadingwidget/loading_widget.dart';
import 'package:school_app/common/models/subject.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/student/screens/class/class_controller.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClassController>();

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LoadingWidget());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppPalette.greyColor,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading classes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.greyColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.errorMessage.value,
                  style: TextStyle(fontSize: 14, color: AppPalette.greyColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refreshSubjects,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.subjects.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 64,
                  color: AppPalette.greyColor,
                ),
                const SizedBox(height: 16),
                Text(
                  'No classes available',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.greyColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'You are not enrolled in any classes yet.',
                  style: TextStyle(fontSize: 14, color: AppPalette.greyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshSubjects,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: controller.subjects.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final subject = controller.subjects[index];
                return ClassTile(subject: subject);
              },
            ),
          ),
        );
      }),
    );
  }
}

class ClassTile extends StatelessWidget {
  final Subject subject;

  const ClassTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.classDetailScreen, arguments: subject);
      },
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.white.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppPalette.primaryColor, AppPalette.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppPalette.primaryColor.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Subject Icon Placeholder
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white24,
              child: const Icon(Icons.book, color: Colors.white),
            ),

            const SizedBox(height: 12),

            // Subject Name
            Text(
              subject.name.isNotEmpty ? subject.name : 'Subject Name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 4),

            // Teacher Name
            Text(
              subject.teacher.name.isNotEmpty
                  ? 'By ${subject.teacher.name}'
                  : 'No Teacher Assigned',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),

            const Spacer(),

            // Bottom Row with Assignment & Grade Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Tooltip(
                      message: 'Assignments',
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RouteName.classDetailScreen,
                            arguments: {
                              'subject': subject,
                              'initialTab': 0, // Assignments tab
                            },
                          );
                        },
                        child: const Icon(
                          Icons.assignment,
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Tooltip(
                      message: 'Grades',
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RouteName.classDetailScreen,
                            arguments: {
                              'subject': subject,
                              'initialTab': 1, // Grades tab
                            },
                          );
                        },
                        child: const Icon(
                          Icons.grade,
                          size: 26,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
