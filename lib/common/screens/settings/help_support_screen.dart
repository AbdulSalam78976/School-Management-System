import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: 'How do I submit an assignment?',
      answer:
          'Go to your class, tap on the assignment, and use the upload button to submit your work. You can upload multiple files including PDF, DOC, and images.',
    ),
    FAQItem(
      question: 'How can I check my grades?',
      answer:
          'Navigate to your class and tap on the "Grades" tab to view your academic performance and recent grades.',
    ),
    FAQItem(
      question: 'How do I mark my attendance?',
      answer:
          'Attendance is automatically marked when you attend classes. You can view your attendance record in the attendance section.',
    ),
    FAQItem(
      question: 'How can I contact my teachers?',
      answer:
          'Use the Messages feature to communicate with your teachers. You can send messages and receive responses directly through the app.',
    ),
    FAQItem(
      question: 'What if I forget my password?',
      answer:
          'Contact your school administrator or use the "Forgot Password" option on the login screen to reset your password.',
    ),
    FAQItem(
      question: 'How do I update my profile?',
      answer:
          'Go to Settings > Profile to update your personal information, profile picture, and other details.',
    ),
  ];

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
                'Help & Support',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.primaryColor,
                ),
              ),
              const SizedBox(height: 24),

              // Contact Support
              _buildSectionCard('Contact Support', [
                _buildContactTile(
                  icon: Icons.email,
                  title: 'Email Support',
                  subtitle: 'Send us an email',
                  onTap: _contactEmail,
                ),
                _buildContactTile(
                  icon: Icons.phone,
                  title: 'Call Support',
                  subtitle: 'Call our support team',
                  onTap: _contactPhone,
                ),
                _buildContactTile(
                  icon: Icons.chat,
                  title: 'Live Chat',
                  subtitle: 'Chat with our support team',
                  onTap: _startLiveChat,
                ),
              ]),

              const SizedBox(height: 24),

              // Quick Actions
              _buildSectionCard('Quick Actions', [
                _buildActionTile(
                  icon: Icons.bug_report,
                  title: 'Report a Bug',
                  subtitle: 'Report any issues you encounter',
                  onTap: _reportBug,
                ),
                _buildActionTile(
                  icon: Icons.feedback,
                  title: 'Send Feedback',
                  subtitle: 'Share your suggestions with us',
                  onTap: _sendFeedback,
                ),
                _buildActionTile(
                  icon: Icons.book,
                  title: 'User Guide',
                  subtitle: 'Learn how to use the app',
                  onTap: _openUserGuide,
                ),
              ]),

              const SizedBox(height: 24),

              // FAQ Section
              _buildSectionCard('Frequently Asked Questions', [
                ..._faqItems.map((faq) => _buildFAQItem(faq)).toList(),
              ]),

              const SizedBox(height: 24),

              // App Information
              _buildSectionCard('App Information', [
                _buildInfoTile(
                  icon: Icons.info,
                  title: 'App Version',
                  subtitle: '1.0.0',
                ),
                _buildInfoTile(
                  icon: Icons.update,
                  title: 'Last Updated',
                  subtitle: 'December 2024',
                ),
                _buildInfoTile(
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                  subtitle: 'Read our privacy policy',
                  onTap: _viewPrivacyPolicy,
                ),
                _buildInfoTile(
                  icon: Icons.description,
                  title: 'Terms of Service',
                  subtitle: 'Read our terms of service',
                  onTap: _viewTermsOfService,
                ),
              ]),
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

  Widget _buildContactTile({
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
          color: AppPalette.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppPalette.primaryColor.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppPalette.primaryColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppPalette.primaryColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppPalette.primaryColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppPalette.primaryColor,
              size: 16,
            ),
          ],
        ),
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

  Widget _buildFAQItem(FAQItem faq) {
    return ExpansionTile(
      title: Text(
        faq.question,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            faq.answer,
            style: TextStyle(fontSize: 14, color: AppPalette.greyColor),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
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
                color: AppPalette.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppPalette.accentColor, size: 20),
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
            if (onTap != null)
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

  void _contactEmail() {
    _showSnackBar('Opening email client...', Colors.blue);
  }

  void _contactPhone() {
    _showSnackBar('Opening phone dialer...', Colors.blue);
  }

  void _startLiveChat() {
    _showSnackBar('Starting live chat...', Colors.blue);
  }

  void _reportBug() {
    _showSnackBar('Opening bug report form...', Colors.orange);
  }

  void _sendFeedback() {
    _showSnackBar('Opening feedback form...', Colors.green);
  }

  void _openUserGuide() {
    _showSnackBar('Opening user guide...', Colors.blue);
  }

  void _viewPrivacyPolicy() {
    _showSnackBar('Opening privacy policy...', Colors.blue);
  }

  void _viewTermsOfService() {
    _showSnackBar('Opening terms of service...', Colors.blue);
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
