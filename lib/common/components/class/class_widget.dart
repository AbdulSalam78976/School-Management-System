import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class ClassCard extends StatelessWidget {
  final String title;
  final int studentCount;
  final String? section;
  final String? subject;
  final VoidCallback? onTap;
  final VoidCallback? onAssignmentTap;
  final VoidCallback? onGradeTap;

  const ClassCard({
    super.key,
    required this.title,
    required this.studentCount,
    this.section,
    this.subject,
    this.onTap,
    this.onAssignmentTap,
    this.onGradeTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppPalette.primaryColor, AppPalette.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppPalette.secondaryColor.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Icon, Title, and Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/class.svg", // Add the correct path
                  height: 60,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // Subject
                      if (subject != null)
                        Text(
                          subject!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white60,
                          ),
                        ),
                    ],
                  ),
                ),
                if (section != null)
                  Text(
                    section!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),
            const Spacer(),

            // Bottom Row with Student Count, Assignments, Grades
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Student count with icon
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.people, color: Colors.white70, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        '$studentCount',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                // Assignment and Grade Icons
                Row(
                  children: [
                    Tooltip(
                      message: 'Assignments',
                      child: GestureDetector(
                        onTap: onAssignmentTap,
                        child: Icon(
                          Icons.assignment_turned_in,
                          size: 28,
                          color: Colors.cyan[300],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Tooltip(
                      message: 'Grades',
                      child: GestureDetector(
                        onTap: onGradeTap,
                        child: const Icon(
                          Icons.grade,
                          size: 28,
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
