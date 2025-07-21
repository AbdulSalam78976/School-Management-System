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

      decoration: BoxDecoration(
        color: AppPalette.secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.watch_later_outlined,
            color: AppPalette.primaryColor,
          ),
        ),
        title: Text(
          "$time",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          '$subject, $grade',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
