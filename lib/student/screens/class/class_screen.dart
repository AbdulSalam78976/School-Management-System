import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/student/screens/class/class_controller.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClassController>();

    // Dummy data (replace with your own from controller)
    final subjects = [
      {'name': 'Mathematics', 'icon': Icons.calculate},
      {'name': 'Science', 'icon': Icons.science},
      {'name': 'English', 'icon': Icons.language},
      {'name': 'Computer', 'icon': Icons.computer},
      {'name': 'Urdu', 'icon': Icons.book},
      {'name': 'Islamiat', 'icon': Icons.menu_book},
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: subjects.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return GestureDetector(
              onTap: () {
                // Navigate to subject details screen
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      subject['icon'] as IconData,
                      size: 48,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      subject['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
