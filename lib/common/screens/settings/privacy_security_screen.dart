import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometricAuth = false;
  bool _twoFactorAuth = true;
  bool _locationSharing = false;
  bool _dataAnalytics = true;
  bool _profileVisibility = true;
  bool _gradeVisibility = true;
  bool _attendanceVisibility = true;

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
                'Privacy & Security',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.primaryColor,
                ),
              ),
              const SizedBox(height: 24),

              // Security Settings
              _buildSectionCard('Security', [
                _buildSwitchTile(
                  icon: Icons.fingerprint,
                  title: 'Biometric Authentication',
                  subtitle: 'Use fingerprint or face ID to unlock app',
                  value: _biometricAuth,
                  onChanged: (value) {
                    setState(() {
                      _biometricAuth = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.security,
                  title: 'Two-Factor Authentication',
                  subtitle: 'Add an extra layer of security',
                  value: _twoFactorAuth,
                  onChanged: (value) {
                    setState(() {
                      _twoFactorAuth = value;
                    });
                  },
                ),
                _buildActionTile(
                  icon: Icons.lock_reset,
                  title: 'Change Password',
                  subtitle: 'Update your account password',
                  onTap: _changePassword,
                ),
                _buildActionTile(
                  icon: Icons.device_hub,
                  title: 'Active Sessions',
                  subtitle: 'Manage your active login sessions',
                  onTap: _manageSessions,
                ),
              ]),

              const SizedBox(height: 24),

              // Privacy Settings
              _buildSectionCard('Privacy', [
                _buildSwitchTile(
                  icon: Icons.location_on,
                  title: 'Location Sharing',
                  subtitle: 'Allow app to access your location',
                  value: _locationSharing,
                  onChanged: (value) {
                    setState(() {
                      _locationSharing = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.analytics,
                  title: 'Data Analytics',
                  subtitle: 'Help improve app by sharing usage data',
                  value: _dataAnalytics,
                  onChanged: (value) {
                    setState(() {
                      _dataAnalytics = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.person,
                  title: 'Profile Visibility',
                  subtitle: 'Allow others to see your profile',
                  value: _profileVisibility,
                  onChanged: (value) {
                    setState(() {
                      _profileVisibility = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.grade,
                  title: 'Grade Visibility',
                  subtitle: 'Allow others to see your grades',
                  value: _gradeVisibility,
                  onChanged: (value) {
                    setState(() {
                      _gradeVisibility = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  icon: Icons.calendar_today,
                  title: 'Attendance Visibility',
                  subtitle: 'Allow others to see your attendance',
                  value: _attendanceVisibility,
                  onChanged: (value) {
                    setState(() {
                      _attendanceVisibility = value;
                    });
                  },
                ),
              ]),

              const SizedBox(height: 24),

              // Data Management
              _buildSectionCard('Data Management', [
                _buildActionTile(
                  icon: Icons.download,
                  title: 'Export Data',
                  subtitle: 'Download your personal data',
                  onTap: _exportData,
                ),
                _buildActionTile(
                  icon: Icons.delete_forever,
                  title: 'Delete Data',
                  subtitle: 'Permanently delete your data',
                  onTap: _deleteData,
                ),
                _buildActionTile(
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                  subtitle: 'Read our privacy policy',
                  onTap: _viewPrivacyPolicy,
                ),
                _buildActionTile(
                  icon: Icons.description,
                  title: 'Terms of Service',
                  subtitle: 'Read our terms of service',
                  onTap: _viewTermsOfService,
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

  Widget _buildActionTile({
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

  void _changePassword() {
    // Navigate to password change screen
    _showSnackBar('Navigate to password change screen', Colors.blue);
  }

  void _manageSessions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Active Sessions'),
        content: const Text(
          'Manage your active login sessions across devices.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Session management opened', Colors.green);
            },
            child: const Text('Manage'),
          ),
        ],
      ),
    );
  }

  void _exportData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: const Text(
          'Your data will be exported and sent to your email.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Data export initiated', Colors.green);
            },
            child: const Text('Export'),
          ),
        ],
      ),
    );
  }

  void _deleteData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Data'),
        content: const Text(
          'This will permanently delete all your data. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Data deletion requested', Colors.orange);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _viewPrivacyPolicy() {
    _showSnackBar('Privacy policy opened', Colors.blue);
  }

  void _viewTermsOfService() {
    _showSnackBar('Terms of service opened', Colors.blue);
  }

  void _saveSettings() {
    _showSnackBar('Privacy and security settings saved!', Colors.green);
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
