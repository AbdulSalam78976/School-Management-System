import 'package:flutter/material.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class UpcomingClassTile extends StatelessWidget {
  final String time;
  final String subject;
  final String grade;

  const UpcomingClassTile({
    super.key,
    required this.time,
    required this.subject,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppPalette.borderColor, AppPalette.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.watch_later_outlined),
          ),
          const SizedBox(width: 12),
          // Class Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$subject, $grade',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
