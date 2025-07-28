import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _assignmentReminders = true;
  bool _gradeUpdates = true;
  bool _announcements = true;
  bool _messages = true;
  bool _attendanceReminders = true;
  bool _classReminders = true;
  bool _examReminders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.primaryColor,
                ),
              ),
              const SizedBox(height: 24),

              // General Notification Settings
              _buildSectionCard('General Notifications', [
                _buildSwitchTile(
                  icon: Icons.notifications_active,
                  title: 'Push Notifications',
                  subtitle: 'Receive push notifications on your device',
                  value: _pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      _pushNotifications = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.email,
                  title: 'Email Notifications',
                  subtitle: 'Receive notifications via email',
                  value: _emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      _emailNotifications = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.sms,
                  title: 'SMS Notifications',
                  subtitle: 'Receive notifications via SMS',
                  value: _smsNotifications,
                  onChanged: (value) {
                    setState(() {
                      _smsNotifications = value;
                    });
                  },
                ),
              ]),

              const SizedBox(height: 24),

              // Academic Notifications
              _buildSectionCard('Academic Notifications', [
                _buildSwitchTile(
                  icon: Icons.assignment,
                  title: 'Assignment Reminders',
                  subtitle: 'Get reminded about upcoming assignments',
                  value: _assignmentReminders,
                  onChanged: (value) {
                    setState(() {
                      _assignmentReminders = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.grade,
                  title: 'Grade Updates',
                  subtitle: 'Get notified when new grades are posted',
                  value: _gradeUpdates,
                  onChanged: (value) {
                    setState(() {
                      _gradeUpdates = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.school,
                  title: 'Class Reminders',
                  subtitle: 'Get reminded about upcoming classes',
                  value: _classReminders,
                  onChanged: (value) {
                    setState(() {
                      _classReminders = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.quiz,
                  title: 'Exam Reminders',
                  subtitle: 'Get reminded about upcoming exams',
                  value: _examReminders,
                  onChanged: (value) {
                    setState(() {
                      _examReminders = value;
                    });
                  },
                ),
              ]),

              const SizedBox(height: 24),

              // Communication Notifications
              _buildSectionCard('Communication Notifications', [
                _buildSwitchTile(
                  icon: Icons.announcement,
                  title: 'Announcements',
                  subtitle: 'Get notified about school announcements',
                  value: _announcements,
                  onChanged: (value) {
                    setState(() {
                      _announcements = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.message,
                  title: 'Messages',
                  subtitle: 'Get notified about new messages',
                  value: _messages,
                  onChanged: (value) {
                    setState(() {
                      _messages = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.calendar_today,
                  title: 'Attendance Reminders',
                  subtitle: 'Get reminded to mark attendance',
                  value: _attendanceReminders,
                  onChanged: (value) {
                    setState(() {
                      _attendanceReminders = value;
                    });
                  },
                ),
              ]),

              const SizedBox(height: 24),

              // Notification Schedule
              _buildSectionCard('Notification Schedule', [
                _buildTimeTile(
                  icon: Icons.access_time,
                  title: 'Quiet Hours',
                  subtitle: 'Set quiet hours for notifications',
                  onTap: _showQuietHoursDialog,
                ),
                _buildTimeTile(
                  icon: Icons.schedule,
                  title: 'Reminder Timing',
                  subtitle: 'Set when to receive reminders',
                  onTap: _showReminderTimingDialog,
                ),
              ]),

              const SizedBox(height: 24),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveSettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save Settings',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppPalette.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppPalette.primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: AppPalette.greyColor),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppPalette.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppPalette.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppPalette.secondaryColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: AppPalette.greyColor),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppPalette.greyColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showQuietHoursDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiet Hours'),
        content: const Text(
          'Set quiet hours when you don\'t want to receive notifications.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Quiet hours settings updated', Colors.green);
            },
            child: const Text('Set'),
          ),
        ],
      ),
    );
  }

  void _showReminderTimingDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reminder Timing'),
        content: const Text(
          'Set when you want to receive reminders for assignments and classes.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Reminder timing updated', Colors.green);
            },
            child: const Text('Set'),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    // Simulate saving settings
    _showSnackBar('Notification settings saved successfully!', Colors.green);
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
